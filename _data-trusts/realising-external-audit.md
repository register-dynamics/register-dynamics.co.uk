---
title: "The ledger: realising the benefits of external audit"
excerpt: |
  Allowing data held in trust to be externally audited provides the hard evidence necessary for the enforcement of contracts and reputational benefits that can improve the data sharing ecosystem. But how does external auditing actually work, what information does it require, and how can it be applied to data?
image: "ledger.jpg"
licenses:
  - "\"Ledger\" image by [George Redgrave](https://www.flickr.com/photos/funfilledgeorgie/) used under [CC BY-ND 2.0](https://creativecommons.org/licenses/by-nd/2.0/)."
  - "This report is licensed under [Creative Commons Attribution-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)."
---
Allowing data held in trust to be externally audited provides the hard evidence necessary for the enforcement of contracts and reputational benefits that can improve the data sharing ecosystem. But how does external auditing actually work, what information does it require, and how can it be applied to data?

![A small book showing accounts]({{ site.url }}/{{ page.image }})

In financial audit, a company’s books comprise a ledger of what the company has done with its money: what has come in, where it has come from, what has gone out and where it has gone to. A company produces its own books and these books are subject to independent scrutiny. It is possible to “cook” these books but a combination of independently controlled audit trails exist to make this more difficult than simply falsifying the books.

For each entry in the ledger, there should be a corresponding entry on a bank statement. The bank statement is controlled independently so it’s nearly impossible for the company to forge.

During an audit, an auditor checks that the books and the bank statement agree. The auditor does not need a detailed understanding of each transaction to be able to spot this – it’s quick and easy for the auditor to show that something improper has occurred, just by showing that entries are missing or are incorrect.

The key element of this model is that there is an external signal available to an auditor with which they can compare internal records. How can this be applied to auditing data access? As there is no entity that plays the role of the “bank” in this situation, we look to technology to provide one.

## External audit for data

A data provider can produce an independently verifiable “data access ledger” that is difficult to forge. The provider can enforce that all read and write access to its important data go via the ledger. By publishing metadata about the ledger, it will then have something independent that can be cross-referenced against during an external audit.

The ledger is structured as an append-only log. New accesses are added to the end of the log and the historical entries cannot be changed. This is enforced by constructing a special technical data structure called a [Merkle tree](./merkle-trees.html) over the events. Every so often, a _[root hash](https://en.wikipedia.org/wiki/Cryptographic_hash_function)_ can be calculated for the Merkle tree, which opaquely represents the state of the log at a particular time.

If this root hash is published publicly then it becomes a commitment to the current contents of the log – the data provider has given up control of their log up until that point and provided an external signal that means the log entries can no longer be forged. This is the data access ledger equivalent of the bank statement entry. Unlike a bank statement, the act of publishing the root hash doesn’t actually reveal any of the information in the log, so it is safe to do even when sensitive data is involved.

The log can be tampered with at any time between audits, and the fact that the log doesn’t match the commitments is only caught at the next audit. With a little extra information, tampering can be caught at the next public commitment. This provides an early signal of bad activity and makes clear when the tampering occurred. Along with a hash, the provider publishes a [“consistency proof”](./merkle-trees.html) – extra metadata that shows that the ledger now is the same ledger from the previous commitment but with some items added (and none changed or removed).

The provider has a few different ways of publishing these commitments. Commitments are quite small and fit into 40-80 characters, depending on the hash algorithm in use. They could use anything from a public stream via an independent service such as Twitter through to sending the commitments privately to the auditor directly, or putting them in escrow with a lawyer.

Armed with these external signals, an auditor can be given access to the ledger and can verify that all of the log entries that were committed to are still present by reconstructing the root hashes. If they don’t match the set that were published or provided, the auditor has a quick and easy signal that something has been tampered with. If they do match, they can proceed with the rest of their longer audit of the log contents knowing that they are an accurate representation of what was logged at the time.
