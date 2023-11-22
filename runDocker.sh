#!/bin/bash

  docker build -t alirezakm-portfolio .

 docker run -d -p 3000:3000 alirezakm-portfolio

