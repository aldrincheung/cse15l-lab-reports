
### The test on the code that I reviewed
Code repository of the one that I reviewed: [https://github.com/xis004/markdown-parse](https://github.com/xis004/markdown-parse)
```bash
PS C:\Users\aldri\Desktop\classes\CSE_15L\github\markdown3> java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore MarkdownParseTest
JUnit version 4.13.2
...E.E.E.E.
Time: 0.026
There were 4 failures:
1) test10(MarkdownParseTest)
java.lang.AssertionError: expected:<[`google.com, google.com, ucsd.edu]> but was:<[url.com, `google.com, google.com, ucsd.edu]>
        at org.junit.Assert.fail(Assert.java:89)
        at org.junit.Assert.failNotEquals(Assert.java:835)
        at org.junit.Assert.assertEquals(Assert.java:120)
        at org.junit.Assert.assertEquals(Assert.java:146)
        at MarkdownParseTest.test10(MarkdownParseTest.java:48)
2) test11(MarkdownParseTest)
java.lang.AssertionError: expected:<[b.com, a.com(()), example.com]> but was:<[a.com, a.com(()), example.com]>
        at org.junit.Assert.fail(Assert.java:89)
        at org.junit.Assert.failNotEquals(Assert.java:835)
        at org.junit.Assert.assertEquals(Assert.java:120)
        at org.junit.Assert.assertEquals(Assert.java:146)
        at MarkdownParseTest.test11(MarkdownParseTest.java:60)
3) test12(MarkdownParseTest)
java.lang.AssertionError: expected:<[https://ucsd-cse15l-w22.github.io/]> but was:<[https://www.twitter.com, https://ucsd-cse15l-w22.github.io/, https://cse.ucsd.edu/]>
        at org.junit.Assert.fail(Assert.java:89)
        at org.junit.Assert.failNotEquals(Assert.java:835)
        at org.junit.Assert.assertEquals(Assert.java:120)
        at org.junit.Assert.assertEquals(Assert.java:146)
        at MarkdownParseTest.test12(MarkdownParseTest.java:72)
4) testMissingCloseParen(MarkdownParseTest)
java.lang.AssertionError: expected:<[a.co]> but was:<[]>
        at org.junit.Assert.fail(Assert.java:89)
        at org.junit.Assert.failNotEquals(Assert.java:835)
        at org.junit.Assert.assertEquals(Assert.java:120)
        at org.junit.Assert.assertEquals(Assert.java:146)
        at MarkdownParseTest.testMissingCloseParen(MarkdownParseTest.java:28)

FAILURES!!!
Tests run: 7,  Failures: 4
```

### The test on my code
my code repository: [https://github.com/aldrincheung/markdown-parse](https://github.com/aldrincheung/markdown-parse)
```bash
PS C:\Users\aldri\Desktop\classes\CSE_15L\github\markdown-parse> java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore MarkdownParseTest
JUnit version 4.13.2
..E.E.E.........
Time: 0.023
There were 3 failures:
1) test10(MarkdownParseTest)
java.lang.AssertionError: expected:<[`google.com, google.com, ucsd.edu]> but was:<[url.com, `google.com, google.com]>
        at org.junit.Assert.fail(Assert.java:89)
        at org.junit.Assert.failNotEquals(Assert.java:835)
        at org.junit.Assert.assertEquals(Assert.java:120)
        at org.junit.Assert.assertEquals(Assert.java:146)
        at MarkdownParseTest.test10(MarkdownParseTest.java:133)
2) test11(MarkdownParseTest)
java.lang.AssertionError: expected:<[b.com, a.com(()), example.com]> but was:<[a.com(()]>
        at org.junit.Assert.fail(Assert.java:89)
        at org.junit.Assert.failNotEquals(Assert.java:835)
        at org.junit.Assert.assertEquals(Assert.java:120)
        at org.junit.Assert.assertEquals(Assert.java:146)
        at MarkdownParseTest.test11(MarkdownParseTest.java:145)
3) test12(MarkdownParseTest)
java.lang.AssertionError: expected:<[https://ucsd-cse15l-w22.github.io/]> but was:<[]>
        at org.junit.Assert.fail(Assert.java:89)
        at org.junit.Assert.failNotEquals(Assert.java:835)
        at org.junit.Assert.assertEquals(Assert.java:120)
        at org.junit.Assert.assertEquals(Assert.java:146)
        at MarkdownParseTest.test12(MarkdownParseTest.java:157)

FAILURES!!!
Tests run: 13,  Failures: 3
```
