#!/bin/bash

scp ./WhereAmI.java cse15:~/
ssh cse15 "javac ./WhereAmI.java; java WhereAmI"