---
titie: Certificate Transparency and DeepMind
---
Founded in 2011 and [standardised by the IETF in 2013](https://tools.ietf.org/html/rfc6962), Certificate Transparency is Google's effort to improve trust in the SSL Certificate ecosystem.

After 25 years of use and a series of attacks, compromises and misbehaviour of major certificate authorities, the SSL/TLS certificate system used to secure HTTPS was showing its age. Structural flaws in the way that certificates were issued and managed were well known and several problems had been seen in the wild. Whilst originally aimed at "e-commerce" on the world-wide-web, SSL, and its successor TLS, were now the mainstay of security for millions of web browser users. Things had changed: and now, nation state adversaries targeting the inboxes of dissidents, or even journalists, on Google's emMail service Ggmail, needed to be part of the threat model. The technical protocols had proven difficult to evolve and the large number of certificate vendors meant that starting from scratch with a new overhauling the certificate issuance process would not be viable.

Emilia Kasper, Adam Langley and Ben Laurie worked out an elegant solution to many of the structural problems and, in hindsight, it islooks very much like one of the first examples of a data trust in the wild!

Certificate Authorities issue certificates to their customers as they always have but now they also add them to a publicly available "log". When a browser wants to check the validity of a certificate, after performing all its usual checks, it now also checks for the existence of that certificate in the log.

The result of this is that if a certificate is issued by a certificate authority, it has to be publicly announced. This means that a certificate authority cannot be coerced into privately issuing a valid certificate for, say, gmail.com, to a someone who wants to perform a man-in-the-middle attack on a dissident's inbox. If such a certificate was to be issued, it would appear in the log where everyone would be able to see it. Certificate Transparency ensures that if a certificate is issued to someone then it is issued to everyone and becomes a matter of irrefutable public record.

The log also acts as a more general system of record for which certificates were issued and when. If a certificate authority is later discovered to have been issuing certificates without performing the proper checks (e.g. that the person the certificate is issued to controls the domain the certificate is issued for) then all other certificates from that authority can be retrieved from the log and checked. This is the principle of "trust but verify". The certificate authorities are trusted to go about their business as they always have but if that trust is later shown to have been misplaced, there is an audit log that is robust enough to allow all of their actions to be independently verified. The public nature of the log also makes it both possible and easy for domain owners to monitor all the certificates that get issued for their domains.

## Privacy implications
Certificate data is not private or particularly sensitive but it has traditionally been spread sparsely around the Internet. A visitor only receives a certificate for a particular website when they visit that site. Web crawlers, such as those used by search engines, are one of the few programs that try to visit every site on the web. This means that, traditionally, only search engine companies have had a good view of the certificate dataset as a whole. Certificate Transparency changes this because now there is a small number of publicly available log servers that will soon list every certificate issued for every domain. As a whole, this data set is more sensitive than the sum of its parts. Algorithms can be used to extract insights about the certificate authority market as well as the certificate renewal habits of systems administrators. This isn't just a difference in the *degree* of access. Tthis is a difference in the *kind* of accessacceess. It is now feasible to perform analysis on that dataset at a price point that wasn't previously affordable by most people.

Algorithms can be used to extract insights about the certificate authority market as well as the certificate renewal habits of systems administrators. For example, SSL certificates aren't usually considered "personal data". However, they contain a field called "Subject Alternative Name" that often lists the names of other websites that are hosted on the same server or IP address. https://arxiv.org/pdf/1809.08325 talks about using these logs for subdomain discovery and for malicious scanning of "new" servers.

Kasper, Langley and Laurie have taken great pains with their design to make it easy to adopt with minimal impact on current operations. They have also aligned the incentives so that it naturally tends to universal adoption rather than requiring massive marketing campaigns and the persuasion of executives based on cashable benefit cases.

The technology itself uses a system of cCryptographic Merkle Tree Proofs to do two things.
1) Ensure that logs are not tampered with or modified by anyone, including the people who run and host them.
2) To allow a certificate's inclusion in a log to be checked by a web browser using only the certificate information provided by the web server at TLS negotiation time.

Logs collect data either directly from certificate authorities or from the certificate ecosystem in general. They hold this data in trust for the benefit of the community. They are monitored and audited.
"Monitoring" is easy and automatic, albeit expensive, because the criteria are well defined and the data is openly available.
"Auditing" is also easy and automatic and substantially cheaper than a full audit.

## How to implement this

In <link> blog post we explain how Cryptographic Proofs can be constructed on top of Merkle Trees and how this can be used to build things like Certificate Transparency.


## DeepMind Health

In 2016 DeepMind [started talking about Verifiable Data Audit](https://deepmind.com/blog/trust-confidence-verifiable-data-audit/ ) which extended many of the technical concepts in Certificate Transparency.. This was partly motivated by Ben Laurie becoming Deep Mind’s Head of Security and Transparency in July 2016. The blog post outlines the necessary extensions and technical difficulties and how they propose to overcome them. However, despite promises to build in the open, no more about this was ever said publicly. No examples of how to handle subsets or summaries of private data ever appeared in the open source Trillian project that they intended to use to implement their design.

Both before and after this Verifiable Data Audit blog post, DeepMind and Google have found themselves the subject of much discussion in the press about how to show the proprietary and ethics of their data and AI programmes. They have also been the target of difficult questions about how they intend to move forward in this space.

There is no doubt that DeepMind can make a massive and substantial contribution to medical science and as a society we would be failing if we were unable to allow them to do so. There is also no doubt that they can bring the expertise to bear to implement the ideas that they talk about in their blog post. However, until the structure of a data trust is well understood by the public and required by social norms, it will be very difficult for companies such as DeepMind to build the solid reputations as responsible data handlers that will enable society at large to be confident letting them do this valuable research with this incredibly sensitive data.
