---
layout: post
title: Luna Lander RL
summary: I used Actor-Critic reinforcement learning to solve the Luna Lander problem.
card_image: /assets/images/lunar_lander.gif
t_use: true
---
The best resource to get started with reinforcement learning is [OpenAI's gym](https://gym.openai.com/). Take it straight from their website: _Gym is a toolkit for developing and comparing reinforcement learning algorithms. It supports teaching agents everything from walking to playing games like Pong or Pinball._ They abstract away all the work of having to code the environments and created a framework for third parties to create their own environments. All you need to worry about it handling the agent you want to teach. I highly recommend anyway that is interested in reinforcement learning to check it out and play around with it. I would start with classic control problems, like CartPole-v1. My only complaint is that there isn't any environments for multi-agent reinforcement learning.

After taking cs639, Sequential Decision Making and Learning, I wanted to test what I learned by talking the [LunarLander-v2](https://gym.openai.com/envs/LunarLander-v2/) environment. In this environment, we are tasked to teach a lander to descend and safely land. We are able to control its 3 thrusters, left, right and bottom, in a binary fashion. My approach to this problem was a simple implantation of [Actor-Critic](https://arxiv.org/pdf/1611.01224.pdf) with batch learning.  
