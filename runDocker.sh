#!/bin/bash
docker build -t alirezakm-portfoli  .

docker run -p 3000:3000 alirezakm-portfoli 