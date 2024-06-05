# Inception

## Table of Contents
- [Introduction](#introduction)
- [Requirements](#requirements)
- [Usage](#usage)
- [Setup](#setup)

## Introduction
Inception is a project designed for School 42 that aims to familiarize students with Docker, containerization, and the management of a multi-container environment. The project involves setting up several interconnected services using Docker Compose by setting up a LEMP stack.

A LEMP stack is a software stack used for web development. It stands for Linux, Nginx, MySQL/ MariaDB, and PHP. Each component of the stack serves a specific purpose:

- Linux: The operating system on which the stack is built.
- Nginx: A high-performance web server and reverse proxy server.
- MariaDB: A popular open-source relational database management system (RDBMS).
- PHP: A server-side scripting language used for web development.

When combined, the LEMP stack provides a powerful environment for hosting and running web applications. Linux serves as the foundation, Nginx handles web server duties, MySQL manages the database, and PHP processes the server-side logic. This stack is commonly used for building and deploying websites and web applications.

## Requirements
- Docker
- Docker Compose

## Usage

### Starting the Environment
To start the environment, run the following command from the project root directory:
```sh
make
```
### Stopping the Environment
To stop the environment, run:

```sh
make down
```
## Setup

### Step 1: Clone the Repository
```sh
git@github.com:Bussiereg/Inception.git
cd inception
```
### Step 2: Build the project with make
```sh
make
```