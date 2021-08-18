---
layout: post
title: Funtional Brain ROI Clustering with InfoMap
summary: TODO right the summary and add failure tag somewhere also figure out dates
card_image: /assets/images/metadatamapequation.svg
t_use: true
---

My first project at [Banks Lab](https://bankslab.wiscweb.wisc.edu/),in the department of Anesthesiology at UW-Madison, was to utilize an [InfoMap](https://www.mapequation.org/) to get a functional clustering of regions of interest (ROIs) with the brain. InfoMap leverages a random walk of a Markov model to cluster said model by its network flow.

Here is a gross oversimplification of what InfoMap does. Imagine that we take a random walk along our Markov model. After our walk, we'll use [Huffman coding](https://en.wikipedia.org/wiki/Huffman_coding) to give each node a binary name based frequency of visitation, then we'll use our new names to write down the path in which we visited our nodes. InfoMap seeks to compress this description of our journey, without losing any information, which will in turn cluster our node, in a functional manner. This is done by grouping nodes into so called 'cities'. Each city will have a unique name, and each node within a city unique name. However, nodes in different cities can share names, like how we can use Seattle and San Francisco as modifiers to differentiate between their respective Maple streets. We take this idea a bit farther thinking about how a state is a modifier for a city and a country is a modifier for a city and so on. Clustering nodes into cities will decrease our journey description length while clustering our nodes, killing two birds with one stone.If you want a deeper general overview can be found at this [Towards Data Science](https://towardsdatascience.com/infomap-algorithm-9b68b7e8b86) post. Also, better yet, here is the paper, [The Map Equation](https://www.mapequation.org/assets/publications/EurPhysJ2010Rosvall.pdf)

I applied this method to electrophysiological data collected from epilepsy patients. I applied various connectivity measure to our electrode time series, which were then used as transition probability for my Markov models. There are various hyperparameters that you can tune to influence more or less clusters, the one I found most useful was Markov Time. Markov Time lets you control the link flow to change the cost of moving between cities (lower mean more cities, higher means less). This hyperparameters was useful since our data was densely connected. Under default settings, all nodes would be clustered into a single city. Lowering the Markov time helped discouraging a single cluster, bring out

![InfoMap Markov Time Example](/assets/images/infomap_markov_time.png "InfoMap Markov Time Example")


nfoMap for AdjMat top 1/3:
Prefrontal:
[IFGop, IFGor, IFGtr, ACC, MFGpf, SFGpf, GR, OG, fOperc, PMC, TFG, CingC, PreCG]
Auditory Core/Non-Core:
[STGP, STGM, STSU, HGAL. HGPM, PT, PostCG]
Auditory Related:
[SMG, AGP, AGA, STSL, MTGP, MTGA, MTGM, ITGA, ITGP, ITGM]
Limbic:
[Insp, Insa, PP, TP, PHG, Amyg, Hipp, FG]
STGA is alone
InfoMap for AdjMat top 1/3 Normalized:
Same  as before but STGA, STLS, MTGA, and ITGA al joined the Limbic cluster

markov time
