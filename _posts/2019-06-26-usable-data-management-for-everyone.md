---
title: Usable data management for everyone
author: Andy Bennett
image: "images/visi-calc-spreadsheets-in-the-80s.jpg"
excerpt: |
  In the early 1980s the spreadsheet transformed the financial and accounting industry. Over the last few years, business has once again begun to change. How are disruptive companies such as Uber and Airbnb reaping the rewards of putting cloud-based data management at the fingertips of their own teams?
licenses:
  - "\"Visi-calc\" image by [Betsy Weber](https://www.flickr.com/photos/betsyweber/) used under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/)."
---
[Registers.app](https://registers.app/) is a tool for creating, sharing and using Linked Reference Data. It’s a tool we’ve been working on for a while and I’m looking forward to telling you more about it.

In this post, I’d like to share some of my thoughts around where Registers.app has come from and why I believe it is so important for the future.

Modern, cloud-aware, reference data management products such as Registers.app have an incredibly important part to play in the future of digital transformation. Here’s why…

## Usability, Autonomy and Agency matter
![Slide from Dan Bricklin's presentation showing an advert for Visi-Calc]({{ site.url }}/images/visi-calc-spreadsheets-in-the-80s.jpg)

In the early 1980s the spreadsheet transformed the financial and accounting industry. A tool that could automatically crunch numbers, update projections and model cash flows revolutionised the way that business was managed and conducted.

The power of the spreadsheet was in the way it put the accountant in direct control of the modelling process and gave them [agency and autonomy](https://dataingovernment.blog.gov.uk/2019/06/10/improving-how-we-manage-spreadsheet-data/). They could define their own formulae. They no longer had to wait for data processing people to model things for them and run it through mainframe computers that were far away. They could make changes at will and run any number of "what-if" scenarios. They no longer had to wait for teams of people to recalculate and check everything.

This decrease in turn-around time wasn't just a difference in *degree*: it made a difference in *kind*. People tested scenarios that they wouldn't have bothered with before. This interactive experience gave them insight that they wouldn't have gained before. And it's well known that humans learn best when they're exposed immediately to the results of their actions. It's similar to the advantages that programmers enjoy when they get immediate feedback from their changes rather than having to wait for lengthy compile-deploy-run-debug cycles.

This powerful tool, originally targeted at replacing traditional ledger sheets soon saw more general applications outside of the accounting office.

## Powerful tools are used in ways their authors never imagined

People started to use spreadsheets in ways its inventors Dan Bricklin and Bob Frankston had not even conceived. It was used to store all sorts of business data, customer lists and task lists… and things have remained more-or-less the same ever since.

However, over the last few years, business has once again begun to change. Silicon Valley got its name from the semiconductor start-ups such as Fairchild that grew there in the late 1950s. It was technology focused. Gradually more and more of the companies turned to software and by the turn of the century companies such as PayPal were thriving. These companies were still tech focused though.

Today things are different. Start-ups such as Uber and Airbnb are not tech companies. They're not engaged in research and development that will spawn entire new industries. They're firmly focused on disrupting existing business processes.

Existing companies are struggling to compete. With a digitally literate, multi-disciplinary team and modern, cloud-based data management techniques, Uber can conduct business experiments in days that would take others many months. They can have an idea, say, "What if we charged different customers different amounts for their ride?", spin up a team to investigate it and have a product feature like surge-pricing available in a week or so.

One of the reasons they can do this is because of their attitude to data.

Their team doesn't have to wait around for other business groups to send them spreadsheets. They don't need to spend weeks combing through, cleaning and re-keying those spreadsheets. They don't need to wait for data people to get to their requests for help. They don't need to wait for operations people to create databases and grant access.

The people in their teams are multi-disciplinary and have the tools they need directly available to them. Everything is self-service. Data sources such as ride requests and user density are available internally. They can access local weather and event information via APIs.

## Technology needs to be in the hands of the users

At Register Dynamics we understand the importance of putting the practitioners in the driving seat: cutting out middlemen who cost time, reduce autonomy and deny users their agency.

[Registers.app](https://registers.app/) will allow its users to interact, in a machine-readable way, with data from other parts of the business as well as data provided openly by others in the cloud.

For example, our OS Open Names Register provides Ordnance Survey's [open location data](https://www.ordnancesurvey.co.uk/business-and-government/products/os-open-names.html) in a standard way that does not require the user to understand the specifics of [Geographic Markup Language](https://en.wikipedia.org/wiki/Geography_Markup_Language) or be an expert in [GIS systems](https://en.wikipedia.org/wiki/Geographic_information_system).

Because the data is machine readable and type-aware it allows the user to consume the data in the format that they require. The co-ordinates in the original dataset are in [OS's own coordinate system (OSGB36)](https://en.wikipedia.org/wiki/Ordnance_Survey_National_Grid) that they use to survey the British Isles. Many users require the data in a format such as [WGS84 (GPS format)](https://en.wikipedia.org/wiki/World_Geodetic_System) as that's what many cloud-based mapping products such as [Open Streetmap](https://www.openstreetmap.org/) or [Google Maps](https://www.google.co.uk/maps) work with. When the data is accessed via the Register, this transformation is done automatically.

This example seems trivial. OSGB36 and WGS84 are well defined. The OS data is freely available from the OS website and is of high quality. The maths behind the coordinate transformation is well defined and widely understood.

Nevertheless, we have seen a multitude of cases amongst our customers where they wanted to put points on a map as part of a service. In every case we've seen this has repeatedly taken senior developers weeks of development time to get it working, tested, fully integrated and kept up-to-date as things change.

## Registers.app can help you get value from your data
![Registers.app logo]({{ site.url }}/images/registers-app-linked-reference-data-platform.png)

[Registers.app](https://registers.app) will help you transform your business in ways that will remain competitive as new technology emerges. It will allow you to build coherent services and business processes that are tightly integrated across many departments.

It will reduce the cost of experimentation and increase the chances of getting value from data. It will allow the people who work with the data in their day-to-day lives to produce clean and accurate reference data that is machine-readable and reusable by default.

I’m really excited about what we can offer users and hope that when you try it out, you will be too. Find out more about [Registers.app](https://registers.app) and stay tuned for further updates!
