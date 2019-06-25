---
title: Legal trust + technical trust = data trusts
author: Andy Bennett
image: "images/system-lock.jpg"
excerpt: |
  Technical trust and legal trust are both insufficient by themselves
  to ensure protection of valuable data. Instead we need a vehicle that
  combines the two to allow data use to be auditable and acceptable practice
  to be enforcable. In this post we discuss this concept of a data trust,
  explore what benefits they could bring and how they could be achieved.
licenses:
  - "\"System lock\" image by [Yuri Samoilov](https://www.flickr.com/photos/yusamoilov/) used under CC-BY 3.0."
---

<img src="/images/system-lock.jpg">

Society demands a certain amount of transparency and [auditability over
financial matters](https://www.gov.uk/guidance/audit-accounting-and-reporting-guidance-for-uk-companies#company-reporting).
We want to be sure that those in charge of
vast wealth are acting properly and within what we as a society have
decided is acceptable. Financial impropriety can make or break a
reputation. Whether you're an institution or an individual,
if you're found to be acting improperly with finances, it's either a
serious blow to your reputation, the end of your career,
[or worse](https://www.bbc.co.uk/news/uk-20338042).

As everyday interactions and institutions are moving increasingly online,
data about us is becoming ever more important and valuable. We are starting
to see that the reputations of the people and companies controlling our data
is increasingly based on how they handle it and what they use it for. These
institutions are being asked to meet similar levels of accountability over
how they put their data assets to work.

European societies took the first step in this direction
with the broad reaching and flexible [GDPR legislation](https://ec.europa.eu/commission/priorities/justice-and-fundamental-rights/data-protection/2018-reform-eu-data-protection-rules_en)
that has overhauled most of the existing
[data protection law dating from the late 20th century](https://www.legislation.gov.uk/ukpga/1998/29/contents).
It considers real, currently relevant scenarios and makes an effort to
anticipate the implications of widespread use of AI and other kinds of
[automated decision making](https://gdpr-info.eu/art-4-gdpr/) in the future.

Along with the [Open Data Institute](https://theodi.org/), we believe
that other legal and legislative changes are necessary in order to
support a fully accountable digital future. In their [work on
data trusts](https://theodi.org/article/defining-a-data-trust/),
the ODI outline a legal structure that enables data assets to be
held in trust. A data trust defines what behaviours using that data
are acceptable, much like trusts of financial assets today.

However, legal structures are only useful when they can be enforced.
Without enforcement there is no deterrent to improper behaviour.
Along with organisations such as [DeepMind](https://deepmind.com),
we believe that for something as complex as storing and processing data (especially personal data) there must also be a
[technical angle to the auditing](https://deepmind.com/blog/trust-confidence-verifiable-data-audit/)
so that organisations who do right can prove their good standing and
those that do not can have a legal consequence enforced against them.

It's worth remembering that technical trust is also insufficient by itself
– without any governance layer, breaches of the technical trust have
little consequence. It's when social and technical trust are brought together
that protection over the asset in trust is able to be adequately guaranteed.

There are many ways of linking social trust with technical trust so that
effective data audit can take place. Techniques such as those pioneered
by Google's [Certificate Transparency project](https://www.certificate-transparency.org/)
allow certificate authorities to operate under a ["trust but verify"](https://www.certificate-transparency.org/benefits#TOC-Better-Industry-Conformance-and-Oversight)
model whereby they continue to issue certificates to
their customers as they always have but they are able to demonstrate to
["monitors" and "auditors"](http://www.certificate-transparency.org/how-ct-works#TOC-Basic-Monitor-and-Auditor-Operations)
that they have shown the same certificates to
everyone and have not covertly [issued certificates improperly](https://www.computerworld.com/article/2510677/security0/hackers-acquire-google-certificate--could-hijack-gmail-accounts.html) when under
pressure, such as political pressure from a nation state.

Deep Mind is using
[similar technology](https://deepmind.com/blog/working-nhs-build-lifesaving-technology/)
to ensure that, as an organisation, it maintains proper control
over the data that has been entrusted to it by medical organisations
whilst still being able to use it effectively for the proper purpose.

In a data trust, the trust's charter could require that the trustees (those
who hold the data) store it in a verifiable structure that records all of
the accesses and changes that are made to the data. For open data sets, this extra
transparency allows the trustors (those who own the data) and the general
public to have more confidence that no data impropriety is occuring.

If an organisation holds very sensitive data it can instead publish
secure metadata that opaquely describes the state of their database,
without revealing any of the sensitive data. Periodically the organisation
can show the data and the trustees can check that the organisation's claimed
audit trail matches the historically published secure metadata and publicly
vouch that the organisation has stored and processed the data properly.

Having such a level of transparency could form part of the requirement
for being certified as a [B Corporation](https://bcorporation.net/), or
it could lead to an entirely new, publically-recognisable certificate
that data is held in a proper manner.

Just like accountancy and financial audit today, data audit is a very technical field,
requiring work by certified experts, this auditing process might also be
a specialist undertaking. It may be appropriate for trustees to instead
appoint an auditor. Performing audit of data trusts could represent a
new line of work for traditional auditors and require a new kind of
certification that shows the auditor has the relevant processes,
protections, assurance and vetting in place.

By privately inspecting the organisation and publicly vouching for it,
[existing social systems of trust and reputation](https://www.ajc.com/news/state--regional/auditor-walks-away-from-mimedx-pointing-big-trouble/1iGOo6t3V22dQCbClOMnLJ/)
can be used to ensure that data management is taken as
seriously as financial management.

By using a fully integrated technical component to do the bookkeeping, the
organisation could appoint more than one auditing firm who would work
independently to come to the same conclusions, thus further increasing
the reliability of the claims.

The requirements around the social and legal structures of data trusts
and data-transparent organisations are only just beginning to surface.
Register Dynamics have already been working on a proof of concept
implementation, powered by [Registers technology](https://registers.app).
We also embedded the ideas of mutually reinforcing audit logs and
independent auditability in our work on the UK government's
[Aquae personal data exchange specification](https://docs.google.com/document/d/1bYxzS5Tmh8cn6WqfERr720JRu7Jax5jLDaiDi82c5Jc/edit).

If you'd like to talk more about data trusts and marrying social and
technical trust, please [get in touch with us](mailto:hello@register-dynamics.co.uk).

*Thank you to [Peter Wells](https://theodi.org/person/peter-wells/),
[Ade Adewunmi](https://twitter.com/Adewunmi), and
[Kate Roselli](https://www.katertalks.com/)
for their helpful comments and feedback.*
