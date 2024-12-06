# Design Document for Version 1

## Overview
This document describes the architecture and flow of the initial prototype of the Time Management App.

## System Architecture
1. **Frontend**: Flutter-based UI for logging and querying time.
2. **Backend**: Firebase Realtime Database for storing and retrieving logs.

## Database Schema
- **time_logs**
    - `date`: string (YYYY-MM-DD)
    - `from`: string (HH:MM AM/PM)
    - `to`: string (HH:MM AM/PM)
    - `task`: string
    - `tag`: string

## UML Diagram
![UML Diagram]

## Sequence Diagram
![Sequence Diagram]
