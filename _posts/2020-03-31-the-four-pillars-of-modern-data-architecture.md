---
title: The four pillars of modern data architecture
excerpt: 'In the Internet era, the data problems we have are different. In this first
  in a series of posts, we’ll examine how the different ways that people create and
  use data today impacts how we must shape a data architecture.

  '
authors:
- Simon Worthington
- Andy Bennett
image: images/four-pillars.jpg
licenses:
- '"Four" image by [Not So Dusty](https://www.flickr.com/photos/harryh1882/32070099588)
  used under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/).'
tags:
- technical-strategy
date: 2020-03-30

---
The way in which people think about data – how it should be structured, modelled and managed – is still based on techniques that were established to solve problems in the 60s and 70s. In the Internet era, the [data problems we have are different](https://public.digital/2018/10/12/internet-era-ways-of-working/) – they are more complex, involve more people and require thinking beyond a single organisation.

Traditional data architecture techniques assume that the architect is in full control of their domain and that they have the power to organise their data in logical sets that make sense. For example, it would be weird for a data architecture to have two tables of "customers" – surely these should be deduplicated.

This assumption held true in the mainframe era when organisational data was centralised, but today data is spread more evenly across organisations. Data now exists in a multitude of different systems and applications, each under control of a different individual, team or organisation. Attitudes however have not changed – it surprises (and scares) many people that today it might make sense for there to be multiple "customer" datasets.

![Image of a set of columns from Washington D.C.]({{ site.base_url }}/{{ page.image }})

The way in which data is created and used [is changing](https://medium.com/@AdeAdewunmi/the-world-as-it-is-versus-the-world-as-it-should-be-ee3eac22eb91). User-centered design is increasingly affecting the shape of data and not just the services that generate it. Latent data is being treated as a first-class asset with the expectation of re-use rather than just a by-product.

The job of the architect is no longer to shape data. Data is shaped by domain experts and operational teams working in silos across  the business. Instead the architect’s job is now to make the data available to the business in a way that is responsive to the varied ways that  people really work – and doing so requires understanding new dynamics.

In this first in a series of posts, we’ll examine how the different ways that people create and use data today impacts how we must shape a data architecture.

## How we break down our data architecture
At [Register Dynamics](https://www.register-dynamics.co.uk) we now typically break down the facets of data architecture into four distinct areas.

### 1. Technical
The formal techniques applied by data architects answer questions about how data should be represented and partitioned. Typically, this is akin to finding the most “logical” approach in a perfect world, and suggests deduplicating, denormalising and centralising data where possible.

When thinking about how to design data, this element is typically the one that gets the most attention. It’s where traditional database systems and techniques focus their energy and speaks most to the skills of data architects from technical or scientific backgrounds.

However, a business is not a perfect data structure so traditional data architecture practice can’t always be completely applied. For example, these models don’t say anything about data governance or ownership. Logical modelling is still important and relevant, but it must be considered alongside other more human dynamics discussed next.

### 2. Structural
Best expressed in [Conway’s Law](https://en.wikipedia.org/wiki/Conway%27s_law), data architecture needs to be compatible with the team structure and power hierarchy present in an organisation. What this means is that control and responsibility for data needs to be spread out in the same way that control and responsibility for business is spread out.

It’s no longer possible to decide to redraw the boundaries between datasets – natural boundaries already exist, and business processes that create and consume the data already follow them. Data governance is now a multi-stakeholder game, and the data architect now has to be aware of these boundaries.

Changing the structure of the data (for example, by splitting one dataset into two, or combining two into one) may be synonymous with splitting a business process across different parts of an organisation. Such a task is possible but certainly more challenging than just operating on the data – it would require a change management process and all of the social and political battles that come with it.

Even where there is the will and the power to change organisation structure to be a better fit for data governance, there will always be cases where this isn’t possible. More and more organisations are drawing on external sources of data produced by other organisations with a very stark boundary between the producers and consumers. For example, many data architectures include an understanding of “companies” but data about them is [spread out amongst many external sources](https://registers.blog/registers-are-everybodys-business). Understanding that these boundaries exist and how to operate within them is now key to successful data architecture.

### 3. Economic
Architecting data in a certain way has associated incentives or costs to the organisation. These may be financial, like the costs associated with setting up data sharing with external organisations and all of the process and legal work this requires, or they may be friction costs that motivate or demotivate individuals to a certain way of working.

Consider two teams or organisations who both have an interest in a dataset. They may both have a business need, and it seems reasonable to assume they would save effort by collaborating. This is true in lots of domains, so why do we see so little data sharing?

The answer is simply economic: for private sector organisations there has to be enough direct, cashable value in collaborating to overcome the disadvantages (costs and friction) associated with working together. Value can also be added with a more sophisticated cost model – for example, by enabling innovative R&D projects to happen.

Collaboration around data is currently hard. [Trying to scale simple spreadsheets to multiple stakeholders is tough](https://registers.blog/solving-conundrums-of-spreadsheets-at-scale). As soon as collaboration gets any more complicated than spreadsheets via email, there are high IT system costs involved because there’s no commodity data infrastructure that makes this easy and cheap. All in all, the friction involved with collaborating and coordinating can be high, so many simply decide to not bother even where there’s a shared interest.

Even in architectures where it might initially seem like effort could be saved, the economics of the situation often transpires differently. Data architects need to understand, and work with, these economic forces in order to design successful architecture and governance.

### 4. Emotional
The responsibilities and control a data architecture gives to (or takes away from) individuals or teams has an emotional impact that causes them to accept or reject the architecture.

Trying to take away control from a team by centralising data or forcing them to operate through an unhelpful interface or central IT team causes some of the most disruptive friction. This could be explicit, through complaints and politics. Or worse, it could be implicit: the team might not fully adopt the change and invisibly keep using their existing process, subsequently leading to data quality problems.

This goes the other way too: trying to make someone responsible for data that they’re not comfortable with will cause the same sorts of friction and problems. Data owners don’t want to accept the risk of being authoritative for something that they don’t understand or control. For example, trying to get a data owner to mix high-provenance data they’ve verified themselves with low-provenance user-submitted data will typically be met with resistance.

Architects need to understand how process owners feel about the data, how its provenance ties in with their business process, and ultimately what owners are willing to take responsibility for as part of their role.

## Data architecture today must consider all four areas
Designing a data architecture that has negative impact on just one of these areas is challenging, and the architecture will create considerable friction that will require work to overcome.

The reality is typically worse – many organisations consider only their own immediate line-of-business needs. Trying to solve data problems without even understanding the nuance of all four elements is doomed to failure. You can’t fight an enemy you can’t see.

As the series continues, we’ll show a worked example of these facets in action and then outline how to design a data architecture that keeps them all in harmony. Follow us [on Twitter](https://twitter.com/regdyn) for the latest from this series as we publish future posts.

_Thanks to [Ade Adewunmi](https://mobile.twitter.com/Adewunmi) and [Peter Wells](https://mobile.twitter.com/peterkwells) for reading drafts of this post._