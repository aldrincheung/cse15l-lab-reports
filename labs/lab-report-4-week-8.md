# Lab Report 4 - (week 8)

#### Raw output of tests
[Lab 4 Appendix](../appendix/lab4.md)

<br/>

### My Lab Report
Code repository of the one that I reviewed: [https://github.com/xis004/markdown-parse](https://github.com/xis004/markdown-parse)

my code repository: [https://github.com/aldrincheung/markdown-parse](https://github.com/aldrincheung/markdown-parse)
<br/>

#### Snippet 1
how I turned into a test
```java
@Test
public void test10(){
    Path filename = Path.of("./snippet1.md");
    String contents = "";
    try {
        contents = Files.readString(filename);
    } catch (IOException e) {
        e.printStackTrace();
    }
    assertEquals(List.of("`google.com", "google.com", "ucsd.edu"), MarkdownParse.getLinks(contents));
}
```
Test output of my implementation:
```bash
1) test10(MarkdownParseTest)
java.lang.AssertionError: expected:<[`google.com, google.com, ucsd.edu]> but was:<[url.com, `google.com, google.com]>
        at org.junit.Assert.fail(Assert.java:89)
        at org.junit.Assert.failNotEquals(Assert.java:835)
        at org.junit.Assert.assertEquals(Assert.java:120)
        at org.junit.Assert.assertEquals(Assert.java:146)
        at MarkdownParseTest.test10(MarkdownParseTest.java:133)
```
Test output of the implementation that I reviewed:
```bash
1) test10(MarkdownParseTest)
java.lang.AssertionError: expected:<[`google.com, google.com, ucsd.edu]> but was:<[url.com, `google.com, google.com, ucsd.edu]>
        at org.junit.Assert.fail(Assert.java:89)
        at org.junit.Assert.failNotEquals(Assert.java:835)
        at org.junit.Assert.assertEquals(Assert.java:120)
        at org.junit.Assert.assertEquals(Assert.java:146)
        at MarkdownParseTest.test10(MarkdownParseTest.java:48)
```

<br/>

#### Snippet 2
how I turned into a test
```java
@Test
public void test11(){
    Path filename = Path.of("./snippet2.md");
    String contents = "";
    try {
        contents = Files.readString(filename);
    } catch (IOException e) {
        e.printStackTrace();
    }
    assertEquals(List.of("b.com", "a.com(())", "example.com"), MarkdownParse.getLinks(contents));
}
```
Test output of my implementation:
```bash
2) test11(MarkdownParseTest)
java.lang.AssertionError: expected:<[b.com, a.com(()), example.com]> but was:<[a.com(()]>
        at org.junit.Assert.fail(Assert.java:89)
        at org.junit.Assert.failNotEquals(Assert.java:835)
        at org.junit.Assert.assertEquals(Assert.java:120)
        at org.junit.Assert.assertEquals(Assert.java:146)
        at MarkdownParseTest.test11(MarkdownParseTest.java:145)
```
Test output of the implementation that I reviewed:
```bash
2) test11(MarkdownParseTest)
java.lang.AssertionError: expected:<[b.com, a.com(()), example.com]> but was:<[a.com, a.com(()), example.com]>
        at org.junit.Assert.fail(Assert.java:89)
        at org.junit.Assert.failNotEquals(Assert.java:835)
        at org.junit.Assert.assertEquals(Assert.java:120)
        at org.junit.Assert.assertEquals(Assert.java:146)
        at MarkdownParseTest.test11(MarkdownParseTest.java:60)
```


<br/>

#### Snippet 3
how I turned into a test
```java
@Test
public void test12(){
    Path filename = Path.of("./snippet3.md");
    String contents = "";
    try {
        contents = Files.readString(filename);
    } catch (IOException e) {
        e.printStackTrace();
    }
    assertEquals(List.of("https://ucsd-cse15l-w22.github.io/"), MarkdownParse.getLinks(contents));
}
```
Test output of my implementation:
```bash
3) test12(MarkdownParseTest)
java.lang.AssertionError: expected:<[https://ucsd-cse15l-w22.github.io/]> but was:<[]>
        at org.junit.Assert.fail(Assert.java:89)
        at org.junit.Assert.failNotEquals(Assert.java:835)
        at org.junit.Assert.assertEquals(Assert.java:120)
        at org.junit.Assert.assertEquals(Assert.java:146)
        at MarkdownParseTest.test12(MarkdownParseTest.java:157)
```
Test output of the implementation that I reviewed:
```bash
3) test12(MarkdownParseTest)
java.lang.AssertionError: expected:<[https://ucsd-cse15l-w22.github.io/]> but was:<[https://www.twitter.com, https://ucsd-cse15l-w22.github.io/, https://cse.ucsd.edu/]>
        at org.junit.Assert.fail(Assert.java:89)
        at org.junit.Assert.failNotEquals(Assert.java:835)
        at org.junit.Assert.assertEquals(Assert.java:120)
        at org.junit.Assert.assertEquals(Assert.java:146)
        at MarkdownParseTest.test12(MarkdownParseTest.java:72)
```

### Answering Questions
`Do you think there is a small (<10 lines) code change that will make your program work for snippet 1 and all related cases that use inline code with backticks? If yes, describe the code change. If not, describe why it would be a more involved change.`

It is not very likely that a fix could be made with <10 lines. This is because these backticks can start from any line of the document. And to exclude the links that is partially, or entirely in a backtick, we would have to start with every block of markdown (blocks are seperated by empty lines, (two newline, \\n\\n)). So a fix I am thinking of is to check for backticks before checking links, and store the indexies of the ticks within an ArrayList. And when parsing, if the indexes are within, or partially within any backticks, it would skip them. 

Also, the markdown file should be parsed by markdown blocks, instead of parsing the whole file in one go, in my opinion.

<br/>

`Do you think there is a small (<10 lines) code change that will make your program work for snippet 2 and all related cases that nest parentheses, brackets, and escaped brackets? If yes, describe the code change. If not, describe why it would be a more involved change.`

Yes, I think there can be a small code change. To do this, I am thinking of finding matching brackets until there are no open brackets left. Something like:
```java
while(newBracket != -1 && newBracket<nextBlock && closeParen<nextBlock){
    //find matching bracket
    closeParen = markdown.indexOf(")", newBracket);
    newBracket = markdown.indexOf("(", closeParen);
    nextBlock = markdown.indexOf("\n\n", closeParen);
}
```
with edge cases resolved after this implementation.

<br/>

`Do you think there is a small (<10 lines) code change that will make your program work for snippet 3 and all related cases that have newlines in brackets and parentheses? If yes, describe the code change. If not, describe why it would be a more involved change.`

Yes. Before parsing, I could make a copy string of markdown variable, markdown-copy. Then, I would first replace all `\n\n` with `\0`, then I would remove all `\n`. And at last, replace `\0` with `\n`. This way, all the new lines within brackets would be removed. Similar to the idea of separating markdown file by blocks before parsing.