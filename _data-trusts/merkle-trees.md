---
title: Merkle tree-based logging
excerpt: |
  Certificate Transparency, DeepMind’s Verifiable Data Audit and GDS’s Aquae all rely on logging technology that is append-only and can support “proofs” and “redaction”. But what is this miracle technology? How does it store things in a way that supports strong auditing? And what does it really mean to have a “proof” or a “redacted” item? The answer is a _Merkle tree_.
licenses:
  - "This report is licensed under [Creative Commons Attribution-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)."
---

Certificate Transparency, DeepMind’s Verifiable Data Audit and GDS’s Aquae all rely on logging technology that is append-only and can support “proofs” and “redaction”. But what is this miracle technology? How does it store things in a way that supports strong auditing? And what does it really mean to have a “proof” or a “redacted” item? The answer is a _Merkle tree_.

![Cryptographic hash function operation, showing different inputs giving wildly different outputs.]({{ site.url }}/images/Cryptographic_Hash_Function.svg)

Fundamental to the way Merkle trees work is the ability to take a _cryptographic hash_. A [cryptographic hash](https://en.wikipedia.org/wiki/Cryptographic_hash_function) is just a way to take in some input and receive an opaque number as output. The number exactly represents the input – if a single bit of the input is changed, the output number will be completely different. But despite this connection it’s also impossible to go in reverse – you can’t recover the input if all you have is the output. So, a hash is a way of uniquely representing some piece of content without actually revealing anything about it.

![An ordered log and a binary tree]({{ site.url }}/images/merkle-log-and-tree.svg)

A Merkle tree is a [binary tree structure](https://en.wikipedia.org/wiki/Binary_tree), which just means that each thing that we store has a _parent_ and up to two _children_. In a Merkle tree, we maintain an ordered log of things we want to store and write the hashes of the log items as the leaves of the tree.

![Combining pairs of hashes]({{ site.url }}/images/merkle-hashing.svg)

Each time we have a pair of items, we take their hashes, put them together, and then make a hash of the two. This new hash uniquely represents the pair of items together (including which one comes first). If either of the items changes, or if their order is changed, this subtree hash will also be different.

We can carry on doing this for pairs of items and then also start to do it for pairs of subtree hashes. When we combine two subtree hashes together we get a new subtree hash that now represents all four items in the tree and their order. We can do this at many levels as we like to represent eight, sixteen, thirty-two or however many items we like. The entire contents of the log are then represented by the hash at the root of the tree. Comparing one root hash with another lets someone quickly find out if the two logs are the same, without having to look at all the entries.

![Existence proof diagram]({{ site.url }}/images/merkle-proofs.svg)

The fact we have hashes in a tree structure gives us some special abilities. If someone gives us an item from a log whose root hash is known, they can prove that the item is definitely in the log – this is called an “existence proof”. We can prove this by taking the hash of the item we're given, combining it with some more hashes they gave us telling us about the state of the log, and then comparing the resulting root hash with one we know or is public.

![Consistency proof diagram]({{ site.url }}/images/merkle-consistency-proofs.svg)

If someone gives us a root hash at one time and then gives another one subsequently, they can prove that the second one definitely comes after the first, with no items changed or deleted – this is called a “consistency proof”. In addition to being useful for [checking that audit logs are accurate](https://technology.blog.gov.uk/2015/10/13/guaranteeing-the-integrity-of-a-register/), these two proofs can be used to build tools that allow [proving things in a decentralised manner](https://registers.blog/2018/09/13/open-permits-and-the-power-of-open-source.html).

The usefulness of these proofs in auditing is usually reliant on hashes and proofs being published in a public place or being handed periodically to an auditor. Hashes are quite small – typically only 40 to 80 characters long, and so can be published without much effort. Proofs are a little longer with a size that [increases slowly](https://en.wikipedia.org/wiki/Logarithmic_growth) compared to the size of the Merkle tree.

The tree of hashes structure is what powers the existence and consistency proofs. Each proof is made up of a small number of hashes from the tree that represent specific subtrees or items. The person verifying the proof walks towards the root of the tree combining hashes that they already know with proof hashes they’re not aware of and arrives at a root hash. If this matches the root supplied, the proof is verified. The exact algorithm and contents of the proofs are set out in [RFC 6962](https://tools.ietf.org/html/rfc6962).

Typically, in order to actually build an audit log using a Merkle tree in a real-world application, it makes sense to use open-source software that already implements the low-level Merkle tree structure with a human-friendly interface, like [Orc](https://github.com/register-dynamics/orc) or [Trillian](https://github.com/google/trillian).
