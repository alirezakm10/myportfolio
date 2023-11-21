#!/bin/bash
 docker build -t vite-3d-portfolio:latest .

docker run -p 8080:8080 vite-3d-portfolio:latest