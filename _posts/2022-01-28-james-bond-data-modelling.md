---
title: What James Bond teaches us about data modelling
author: Simon Worthington
image: "images/q-standing-in-front-of-pgadmin.png"
excerpt: |
  Whether you are a fan of James Bond or not, the latest James Bond movie _No Time to Die_ brings up quite a few interesting data modelling challenges.

  We lead you through all the double-o shenanigans and we'll discover some general modelling lessons for operational data.
licenses:
  - "\"Q\" image based on a screenshot owned by MGM/Sony Pictures."
---
Whether you are a fan of James Bond or not, the latest James Bond movie _No Time to Die_ brings up quite a few interesting data modelling challenges.

Leigh Dodds, a legend in the UK civic data community, makes an interesting comment in a Twitter post:

> Leigh Dodds (@ldodds):
>
> Still thinking about the records management issues that having two 007s must have caused MI6.
>
> [https://twitter.com/ldodds/status/1480165253568774145](https://twitter.com/ldodds/status/1480165253568774145)

He's right – _No Time To Die_ rewrites all the rules we know about the Double-O program. The moniker of 007 gets thrown around more times than Oddjob's hat: we have characters being double-os without a number, swapping designations, and all sorts of other terrible business. Forget Bond fighting the bad guys – it's the poor Q Branch data architect who's really having a nightmare.

But this chaos holds a bunch of lessons for how to correctly design operational databases to robustly handle changes in policy – so I'm going to lead you through all the double-o shenanigans, and we'll discover some general modelling lessons for operational data. Onwards!

{% include image.html src=page.image alt="Q played by Ben Wishaw standing in front of PGAdmin 4" %}

## A simple schema for secret agents

Let's start by defining a schema to hold our list of double-o agents:

{% dbml %}
Table agents {
    designation char(4) [primary key, not null]
    name varchar [not null]
    date_enlisted date [not null]
    date_retired date
}
{% enddbml %}

And now let's fill it up with some agents we know about at the start of _No Time To Die_:

| designation | name           | date_enlisted | date_retired |
|-------------|----------------|---------------|--------------|
| 006         | Alec Trevelyan | 01-01-1994    | 01-01-1996   |
| 007         | James Bond     | 01-01-1965    | NULL         |

Cool – now we can keep track of which agent has which designation. When they retire (or expire) we can fill in that resignation date, so we can also easily work out which agents are active and which aren't.

OK, by itself not that interesting, but this is classic reference data – you can imagine hooking it up to some interface where M can shout “Get me Bond!” and then the system can use this list to look up which double-o agent he wants to remotely admonish.


## Change #1: a new 007

The first change to our data comes with the revelation that Bond has retired to pursue a life of leisure and has been replaced by a completely new 007!

Well, Q Branch can handle that: let's update our data to add Bond's resignation date and insert the new agent:

```sql
UPDATE agents SET resignation_date = CURRENT_DATE WHERE designation = '007';
INSERT INTO agents VALUES ('007', 'Nomi', CURRENT_DATE, NULL);
```

Uh-oh, that's an error – our database will complain because we've tried to insert two 007s. We've made a classic mistake in setting the `designation` to be the primary key and therefore unique. Imagine being the data architect who has to tell M they can't reuse 007 because the database unique constraint has failed!

It was unique in all the data we had at the start, and the rule was that we have only one designation per person, so where did we go wrong? The problem is that the rule changed – as they often do. When we designed the schema we encoded what turned out to be a flexible policy rule as a rigid data structure rule that the database will enforce no matter what. Our schema was brittle.

What we should have done is follow a simple maxim:

> If an identifier is produced as part of human-driven decision or process, don't use that identifier as a primary key.

So instead we should have a separate `agent_id` field to act as the primary key.

{% dbml %}
Table agents {
    agent_id int [primary key, auto increment]
    designation char(4) [not null]
    name text [not null]
    date_enlisted date [not null]
    date_retired date
}
{% enddbml %}

| agent_id | designation | name | date_enlisted | date_retired |
|-|-|-|-|-|
| 1 | 006 | Alec Trevelyan | 01-01-1994 | 01-01-1996 |
| 2 | 007 | James Bond | 01-01-1965 | 01-12-2021 |
| 3 | 007 | Nomi | 01-12-2021 | NULL |

Nice. We've recorded Bond's retirement and Nomi's enlistment.


## Change #2: Bond is back

The next shock change is probably a surprise to no one: Bond leaves retirement and is reinstated as a Double-O agent. With it comes his licence to kill our data model. Bizarrely, Nomi retains her designation of 007 and Bond's designation is left intentionally undefined – he's just “reinstated” with no number.

```sql
INSERT INTO agents VALUES (NULL, 'James Bond', CURRENT_DATE, NULL);
```

Bond's return goes down like a lead balloon amongst the Q Branch data architects who now have two problems. Firstly, the schema will complain that a new record can't be added without specifying a designation – but Bond doesn't have one. Whoever goes to tell M that he has to give Bond a designation to appease the database will be receiving a thrown whisky tumbler to the temple.

This is another example of putting constraints on the data that don't represent permanent and immovable real world constraints – instead, we've again encoded policy rules as database structure.

Well, we can remove the constraint on the designation to not be NULL:

{% dbml %}
Table agents {
    agent_id int [primary key, auto increment]
    designation char(4) [not null]
    name text [not null]
    date_enlisted date [not null]
    date_retired date
}
{% enddbml %}

| agent_id | designation | name | date_enlisted | date_retired |
|-|-|-|-|-|
| 1 | 006 | Alec Trevelyan | 01-01-1994 | 01-01-1996 |
| 2 | 007 | James Bond | 01-01-1965 | 01-12-2021 |
| 3 | 007 | Nomi | 01-12-2021 | NULL |
| 4 | NULL | James Bond | 01-12-2021 | NULL |

However, more subtly we've lost connection between the first time Bond was an agent and this new reinstatement – if we'd based any, let's say, access controls or gadget preferences on the old record, this will all have to be set up again against the new record. And it's impossible to tell by looking at the data whether this new agent is the same person or just happens to also be called James Bond.

But before we can deal with that, another crisis is about to unfold.


## Change #3: musical chairs at MI6

Through presumably high respect at Bond's ability to shoot up some stuff, Nomi decides to gift back her 007 designation to Bond. Being distracted by the imminent outbreak of a Third World War, M agrees to this.

Q Branch is once again delirious at this third rule change in as many hours: now two agents have changed designation during their period of active service, and once again they are left with an agent without a designation.

```sql
UPDATE agents SET designation = NULL WHERE agent_id = 3;
UPDATE agents SET designation = '007' WHERE agent_id = 4;
```

| agent_id | designation | name | date_enlisted | date_retired |
|-|-|-|-|-|
| 1 | 006 | Alec Trevelyan | 01-01-1994 | 01-01-1996 |
| 2 | 007 | James Bond | 01-01-1965 | 01-12-2021 |
| 3 | NULL | Nomi | 01-12-2021 | NULL |
| 4 | 007 | James Bond | 01-12-2021 | NULL |

Crucially, the data no longer represents reality. The fact that Nomi was ever 007 has been forgotten, and the fact that Bond was designation-less has also disappeared. We have lost fidelity in the data because of the model we used to represent it.

Why does this matter? Well, if during the period he was designation-less Bond [ordered any stationery](https://www.filmstories.co.uk/features/casino-royale-and-the-secrets-of-james-bonds-emails/), these might now be coming to Nomi if the stationery ordering system is tracking them via designation. Similarly any audit logs that track the designation will look like they're bizarrely incorrect.

There's two ways to solve this: track the designations separately to the agents themselves or introduce more general data versioning.


### Normalising schemas let us track history

In the first approach, we'll split the tables:

{% dbml %}
Table agents {
    agent_id int [primary key, auto increment]
    name text [not null]
}

Table designations {
    designation_id int [primary key, auto increment]
    agent_id int
    designation char(4)
    date_enlisted date [not null]
    date_revoked date
}

Ref: designations.agent_id > agents.agent_id
{% enddbml %}

| agent_id | name |
|-|-|
| 1 | Alec Trevelyan |
| 2 | James Bond |
| 3 | Nomi |

| designation_id | agent_id | designation | date_enlisted | date_retired |
|-|-|-|-|
| 1 | 1 | 006 | 01-01-1994 | 01-01-1996 |
| 2 | 2 | 007 | 14-11-2006 | 01-12-2021 |
| 3 | 3 | 007 | 01-12-2021 | 01-12-2021 |
| 4 | 2 | NULL | 01-12-2021 | 01-12-2021 |
| 5 | 3 | NULL | 30-09-2021 | NULL |
| 6 | 2 | 007 | 30-09-2021 | NULL |

Now we have full fidelity – we can see all of the designations and all the complexity of how they changed. (It might also be necessary to upgrade to a datetime field because things got very spicy during _No Time To Die_.)

There is however another kind of fidelity issue. If Bond was to be declared dead but was later realised to be alive (as in _Skyfall_), Bond's record could be updated to expunge his death (by removing the retirement date) but the fact that he was erroneously presumed dead would be forgotten.

It wouldn't be correct to treat this as a new designation period, because it never really happened. Bond was still 007 for all of that time. It's just the record that was wrong. By inserting a new record, it would look identical to if his designation had ended and immediately resumed – which also isn't really what happened.

The problem is that we're mixing up changes to the data made as a result of a policy change and as a result of an error correction. The two are not the same, and to retain data that can fully explain what is occurring we need to distinguish the two. That is where we use a second approach.


### Data versioning keeps track of errors

The alternative approach is to track versions of each agent record in the same table.

{% dbml %}
Table agents {
    agent_version_id int [primary key, auto increment]
    agent_logical_id int [not null]
    designation char(4) [not null]
    name text [not null]
    date_enlisted date [not null]
    date_retired date
}
{% enddbml %}

| agent_version_id | agent_logical_id | designation | name | date_enlisted | date_retired |
|-|-|-|-|-|
| 1 | 1 | 006 | Alec Trevelyan | 01-01-1994 | 01-01-1996 |
| 2 | 2 | 007 | James Bond | 14-11-2006 | 01-12-2021 |
| 3 | 3 | 007 | Nomi | 01-12-2021 | 01-12-2021 |
| 4 | 2 | NULL | James Bond | 01-12-2021 | 01-12-2021 |
| 5 | 3 | NULL | Nomi | 30-09-2021 | NULL |
| 6 | 2 | 007 | James Bond | 30-09-2021 | NULL |

The difference here is that if we want to find the current designation for an agent we now instead select the row with a `MAX(agent_version_id)` for a given `agent_logical_id`. Clients also have the option to remember the version ID and to ask for a specific version again later if they want to.

This now gives us the ability to correct errors without forgetting about errored data. Bond's record can now be updated to expunge his death without the information about him being presumed dead for a time being forgotten. Clients could query the history and confirm that, yes, for a period the system thought that Bond was dead, but as of now it doesn't think that anymore.

This is a bi-temporal schema because it is tracking two different time variables – policy changes are tracked using dates and error corrections are tracked using version numbers. (This is the same model we use for [recording the UK Customs Tariff](https://digitaltrade.blog.gov.uk/2021/06/08/how-dit-developers-keep-uk-businesses-up-to-date-with-tariff-changes/)!)


## Falling into the same trap, again and again

As a summary, what Q Branch could have done to avoid these issues would have been to:

* Avoid assuming that data produced by a policy will always have the same constraints (e.g. that they'll be unique tomorrow even if they're unique today).
* For identifiers, instead they should introduce different identifiers that are under their control and will always have the properties they desire.
* For other data, they shouldn't enforce flexible policy rules using database structure or constraints.
* Use a data model that separates out policy changes from error corrections – and allows the system to retain both of them.

It would be easy to say that designing in these things from the start is over-complication. After all, the changes were simple enough to make when needed.

I disagree. Good architecture anticipates likely change, including unknowable change. It turns out that most of the issues I've presented here occur eventually in almost all operational databases (for Bond it took 54 years for these problems to appear – but they did!). All data architectures that model this sort of data should be prepared to deal with these issues from the start.

The other reason is that whilst it's easy to update the schema of a database you control, it's a lot more difficult to coordinate structural change across many different systems that might be using that data. Any reasonably sized organisation will be using its own reference data across a wide variety of teams and services. Not all of them will be centralised or able to evolve quickly. In _No Time To Die_, breaking changes happened thick and fast, and that's often how it goes for big policy changes too. By setting out some flexible architecture up front that deals with common problems, we remove the need to make slow, expensive changes later if those problems occur.

What I've hopefully demonstrated is that even simple data can eventually become complex as it makes contact with reality. Being unprepared for these changes is a worse idea than the plot for _Quantum of Solace_ (ouch). But don't be like M and turn to the scotch when you've got hard data problems – instead get in contact with me and the team at Register Dynamics, and we'll have them sorted before you can say “shaken not stirred”.
