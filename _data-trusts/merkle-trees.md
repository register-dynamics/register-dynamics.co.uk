---
title: Merkle tree-based logging
---
Our case studies have mentioned technical data structures called Merkle trees which are append-only and can support “proofs” and “redaction”. But what is this miracle technology? How does it store things in a way that supports strong auditing? And what does it really mean to have a “proof” or a “redacted” item?

_Note: Diagrams will be supplied._

Fundamental to the way Merkle trees work is the ability to take a _cryptographic digest_. A [cryptographic digest](https://en.wikipedia.org/wiki/Cryptographic_hash_function) is just a way to take in some input and receive an opaque number as output. The number exactly represents the input – if a single bit of the input is changed, the output number will be completely different. But despite this connection it’s also impossible to go in reverse – you can’t recover the input if all you have is the output. So, a digest is a way of uniquely representing some piece of content without actually revealing anything about it.

A Merkle tree is a [binary tree structure](https://en.wikipedia.org/wiki/Binary_tree), which just means that each thing that we store has a _parent_ and up to two _children_. In a Merkle tree, we maintain an ordered log of things we want to store and write the digests of the log items as the leaves of the tree.

Each time we have a pair of items, we take their digests, put them together, and then make a digest of the two. This new digest uniquely represents the pair of items together (including which one comes first). If either of the items changes, or if their order is changed, this subtree digest will also be different.

We can carry on doing this for pairs of items and then also start to do it for pairs of subtree digests. When we combine two subtree digests together we get a new subtree digest that now represents all four items in the tree and their order. We can do this at many levels as we like to represent eight, sixteen, thirty-two or however many items we like. The entire contents of the log are then represented by the digest at the root of the tree. Comparing one root digest with another lets someone quickly find out if the two logs are the same, without having to look at all the entries.

The fact we have digests in a tree structure gives us some special abilities. If someone gives us an item from a log whose root digest is known, they can prove that the item is definitely in the log – this is called an “existence proof”.

If someone gives us a root digest at one time and then gives another one subsequently, they can prove that the second one definitely comes after the first, with no items changed or deleted – this is called a “consistency proof”. In addition to being useful for checking that audit logs are accurate, these two proofs can be used to build tools that allow proving things in a decentralised manner.

The usefulness of these proofs in auditing is usually reliant on digests and proofs being published in a public place or being handed periodically to an auditor. Digests are quite small – typically only 40 to 80 characters long, and so can be published without much effort. Proofs are a little longer with a size that [increases slowly](https://en.wikipedia.org/wiki/Logarithmic_growth) compared to the size of the Merkle tree.

The tree of digests structure is what powers the existence and consistency proofs. Each proof is made up of a small number of digests from the tree that represent specific subtrees or items. The person verifying the proof walks towards the root of the tree combining digests that they already know with proof digests they’re not aware of and arrives at a root digest. If this matches the root supplied, the proof is verified. The exact algorithm and contents of the proofs are set out in [RFC 6962](https://tools.ietf.org/html/rfc6962).

Typically, in order to actually build an audit log using a Merkle tree in a real-world application, it makes sense to use open-source software that already implements the low-level Merkle tree structure with a human-friendly interface, like [Orc](https://github.com/register-dynamics/orc) or [Trillian](https://github.com/google/trillian).
