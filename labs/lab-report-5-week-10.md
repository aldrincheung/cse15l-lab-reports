# Lab Report 5 - (week 10)

### How I found the tests with different results
1. I first ran the two implementation, piping the output to results.txt: `bash script.sh > results.txt`
2. Then I copied one of the results.txt to the other file using `cp`
3. Then I use `diff` to find the difference: `diff results.txt resultsCopy.txt`

<br/>

### Test Diff 1 (481.md)
Markdown file
```markdown
[link](/uri "title")

```
Provided implementation:
```
[]
```
My Implementation:
```
[/uri "title"]
```
Actual:
```html
<p><a href="/uri" title="title">link</a></p>
```
##### Neither implementation is correct
- neither implementation is correct because the link should be `/uri` with a second parameter for title. so the output should be `[/uri]`.
- the bug is that the code is **not checking** (doesn't exists code) for a title. For the given implementation, it disqualifies a link whenever there is a space after trimming the link, while my implementation doesn't check for anything.
- The problem is that the code should trim the `potentialLink`, check if there's more than one space, if so discount link. If there is one space, check if the second "item" is closed in quotes. If it adheres to the format of `(/some/link "title")`, then it should only add the link portion

<br/>

### Test Diff 1 (567.md)
Markdown file
```markdown
[foo](not a link)

[foo]: /url1

```
Provided implementation:
```
[]
```
My Implementation:
```
[not a link]
```
Actual:
```html
<p><a href="/url1">foo</a>(not a link)</p>
```
##### Neither implementation is correct
- neither implementation is correct because the link should be `/url1`. The second `[foo]: /url1` sets the url of the previous `[foo]`. And because both code doesn't implement this feature, it doesn't work
- The bug is that the implmentation isn't there. The code should record all `[text]` formats that doesn't have a link afterwards, so that it could add them back when it comes across the format `[text]: /some/link` the would set the url back to that
- for our program, we only need to return the links. So, we would just need to consider the format `[text]: /some/link` and add those links