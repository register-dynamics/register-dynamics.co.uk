---
title: Why your database limits your data quality
author: Alaric Snell-Pym
image: "images/chess.jpg"
excerpt: |
  Real world objects are often more complicated than simple databases
  really understand, and trying to fit those complications into the rigid type
  system of SQL is much like fitting a round peg into a square hole.
licenses:
  – "\"Chess\" image by [ejaugsburg](https://pixabay.com/users/ejaugsburg-148268/) used under the [Pixabay License](https://pixabay.com/service/license/)."
---

Maximising quality is a major tenet to most organisational strategies for data.
We all want our business processes to be relying on accurate, timely data, and
for that data to be re-used for maximum effect in decision-making.

However, fully accurate data is rare. Every dataset has quality issues that
limits the ways it can be used or reused. Understanding why quality issues occur
and how to avoid them is key to making the best use of data.

There is a common maxim that "if you put garbage in, you get garbage out".
However, even when you're putting accurate inputs into your dataset, there are
still systemic issues that mean use and reuse isn't optimal. In this post, we'll
look how database designs laid out in the 1960s are still causing data quality
problems today.

{% include image.html src=page.image alt="Six black chess pieces in rank order" %}


## Real world entities take on multiple roles

Classifying the types of data in your system often leads to one of two problems.
The first is a proliferation of minor variations – for example, a CRM system may
evolve to include `Supplier`, `Customer`, `BothSupplierAndCustomer`, and
`PreferredSupplier` models. The second is a proliferation of objects that
invisibly exist in multiple tables – for example, a company you both buy from
and sell to might exist in both `Supplier` and `Customer` tables, with their
contact details potentially getting updated in one and not the other, leading to
confusing problems.

A common solution with its own problems is to use flags and type fields to
differentiate objects within a type. Invariably this leads to a bunch of
optional fields relevant only to some combinations of flags complicating the
structure of what usually becomes a very wide table.

All of these complicate the schema, complicate the systems that process the
data, and lead to different kinds of errors. We will look at a common way of
managing this kind of schema complexity.


## Database type systems are too rigid

The root of the problem is that most tools force you to assign everything in the
system to a single type. The ubiquitous SQL database which underpins the vast
majority of tools, for instance, makes you choose one table to insert a record
into and each table has a fixed list of columns.

For instance, if you both sell to and buy from the same third party, they
usually end up with records in both the `Supplier` and `Customer` tables, and
they're usually not connected in any way other than that they have the same name
(and more often than you'd like, they don't even have that, because one is "ACME
Ltd" and the other is "Acme Limited").

This means your system doesn't understand that the two records represent the
same thing, and you end up with all sorts of irritating consequences.

The fact is, real-world objects are often more complicated than simple databases
really understand, and trying to fit those complications into the rigid type
system of SQL is much like fitting a round peg into a square hole.


## Programming languages have more expressive type systems

Programming languages tend to have much richer type systems – letting you
express a hierarchy of types, such as "a `Carpenter` is a `StaffMember` with
carpentry skills; a `Plumber` is a `StaffMember` with plumbing skills; a
`StaffMember` is a `Person` with an employee number and a tax reference; a
`Customer` is a `Person` with a credit balance…".

Operations defined in terms of any `Person` (eg, sending them an email) can be
applied to a `Carpenter`, a `Plumber` or even a `Customer`, because they are all
a kind of `Person` and so all have (for example) the "email address" field
defined by being a `Person`.

There's no duplication: a `Carpenter` automatically gets an email address field
in the database because it's a kind of `Person`, so nobody needs to tell the
system that `Carpenter` and `Plumber` both have email addresses. There are no
context-specific "optional" fields: there's no need for a blank carpentry skills
field in a `Plumber`'s record, nor vice versa. If the language supports
multiple inheritance you can even have a `CarpenterAndPlumber` that is defined
as a `Carpenter` and a `Plumber`, having a single email address (as it's a kind
of `Person`) and also having the carpentry and plumbing skills data.

The SQL type system that most databases copy was designed in the 1960s, when
computers were just starting to take over data processing from paper forms and
punched cards. The tasks we expected of our business systems were much simpler
then, and while the world of programming languages has developed to keep up with
the demands of modern application developers, databases have (for various
reasons) failed to evolve.


## Interim solutions

Given that many of the database products we use are stuck with over-simple type
systems, how can we manage? Are we doomed to the kinds of fragile hacks
discussed above?

To be blunt, sadly, yes we are. But with care and self-discipline, the downsides
of these approaches can, at least, be mitigated somewhat.

It's possible to escape a simplistic type system by storing data in some kind of
"blob column"; many databases these days even offer support for extracting
fields from a blob if it's encoded in a format such as JSON, and may even allow
you to index such extracted fields.

This approach tends to come at an efficiency cost and usually means that some of
the database features that could be applied to normal fields aren't usable for
data inside blobs, but most disappointingly, it tends to come at the cost of
losing *any* kind of type system for the blobbed data; the application has to
deal with the possibility of malformed data inside the blobs, missing fields,
and so on. Data integrity becomes an application problem.

The main alternatives that retain some level of data integrity support are more
similar than they at first seem: having very wide tables with lots of "optional"
columns (for instance, having a table of `Contacts` with optional columns that
are used depending on whether that contact is a customer, supplier, employee, or
some combination of the above), and having loads of little tables with a common
key (for instance, having tables for `Contact`, `Customer`, `Supplier`,
`Employee`, etc and using the same primary key value across them when the same
logical object occupies multiple roles).

What they have in common is that *some* of the data integrity problem moves into
the application – in the wide-table case, the application is responsible for
knowing which combinations of optional columns are relevant in different cases.
If a contact is a supplier then a whole bunch of columns that have to be marked
as optional in the database (so that contacts who aren't suppliers don't need to
provide them) become required for that particular record. In the
loads-of-little-tables case, the application has to find a safe way to allocate
new primary key values that are unique across multiple tables.

Thankfully, in the latter case, any type hierarchy rules (eg, any
supplier/customer/employee is always a contact, so must have a contact record)
can be represented using foreign key constraints, which often helps with the
management of uniqueness, but the downside is having to check several tables to
find all the information about an object – or to delete an object.


## Representing data requires careful thought

There aren't really technical solutions you can just drop in to solve this
problem for you; they will all require careful thought to plan how you represent
your complicated real-world data in the simplified world of the database, and
ongoing discipline to make sure that structure doesn't evolve into a tangled
mess.

Thankfully, we at Register Dynamics have plenty of experience we can share with
you – so [get in touch today](mailto:hello@register-dynamics.co.uk) and let us
help!
