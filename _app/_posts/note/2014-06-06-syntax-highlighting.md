---
layout: post
title: Syntax Highlighting
category: note
tags: miscellaneous
---

Code highlighting demo, powered by Rouge. More info about code highlighting can be found at [Jekyll's documentation](https://jekyllrb.com/docs/templates/#code-snippet-highlighting).

```
.code-text (@link, @text) when (lightness(@link) >= 50%) and (lightness(@link) < lightness(@text)) {
  @return-color: lighten(@text, 20%);
  @return-value: 30%;
}
```

```diff
{
  "scripts": {
-   "precommit": "npm test",
-   "commitmsg": "commitlint -E GIT_PARAMS"
  },
+ "husky": {
+   "hooks": {
+     "pre-commit": "npm test",
+     "commit-msg": "commitlint -E HUSKY_GIT_PARAMS"
+   }
+ }
}
```

```ruby
def show
  @widget = Widget(params[:id])
  respond_to do |format|
    format.html # show.html.erb
    format.json { render json: @widget }
  end
end
```

```php?start_inline=1
echo "Hello, world!";
```

{% highlight ruby %}
def print_hi(name)
  puts "Hi, #{name}"
end
print_hi('Tom')
#=> prints 'Hi, Tom' to STDOUT.
{% endhighlight %}

{% highlight html linenos %}
<!doctype html>
<html>
  <head>
    <title>Title!</title>
  </head>
  <body>
    <h1 id="title" class="heading">Example</h1>
    <p id="foo">Hello, World!</p>
    <script type="text/javascript">var a = 1;</script>
    <style type="text/css">#foo { font-weight: bold; }</style>
  </body>
</html>
{% endhighlight %}

```js
// Load the http module to create an http server.
var http = require('http');

// Configure our HTTP server to respond with Hello World to all requests.
var server = http.createServer(function (request, response) {
  response.writeHead(200, {"Content-Type": "text/plain"});
  response.end("Hello World\n");
});

// Listen on port 8000, IP defaults to 127.0.0.1
server.listen(8000);

// Put a friendly message on the terminal
console.log("Server running at https://127.0.0.1:8000/");
```

```css
.code-text (@link, @text) when (lightness(@link) >= 50%) and (lightness(@link) < lightness(@text)) {
  @return-color: lighten(@text, 20%);
  @return-value: 30%;
}
```

```html
<!doctype html>
<html>
  <head>
    <title>Title!</title>
  </head>
  <body>
    <h1 id="title" class="heading">Example</h1>
    <p id="foo">Hello, World!</p>
    <script type="text/javascript">var a = 1;</script>
    <style type="text/css">#foo { font-weight: bold; }</style>
  </body>
</html>
```

```llvm
; copied from https://llvm.org/docs/LangRef.html#module-structure
; Declare the string constant as a global constant.
@.str = private unnamed_addr constant [13 x i8] c"hello world\0A\00"

; External declaration of the puts function
declare i32 @puts(i8* nocapture) nounwind

; Definition of main function
define i32 @main() {   ; i32()*
  ; Convert [13 x i8]* to i8  *...
  %cast210 = getelementptr [13 x i8]* @.str, i64 0, i64 0

  ; Call puts function to write out the string to stdout.
  call i32 @puts(i8* %cast210)
  ret i32 0
}

; Named metadata
!1 = metadata !{i32 42}
!foo = !{!1, null}
```

```xml
<?xml version="1.0" encoding="utf-8"?>
<xsl:template match="/"></xsl:template>
```

```moonscript
util = require "my.module"

a_table = {
  foo: 'bar'
  interpolated: "foo-#{other.stuff 2 + 3}"
  "string": 2
  do: 'keyword'
}

class MyClass extends SomeClass
  new: (@init, arg2 = 'default') =>
    @derived = @init + 2
    super!

  other: =>
    @foo + 2
```

```apache
AddDefaultCharset UTF-8

RewriteEngine On

# Serve gzipped version if available and accepted
AddEncoding x-gzip .gz
RewriteCond %{HTTP:Accept-Encoding} gzip
RewriteCond %{REQUEST_FILENAME}.gz -f
RewriteRule ^(.*)$ $1.gz [QSA,L]
<FilesMatch \.css\.gz$>
  ForceType text/css
  Header append Vary Accept-Encoding
</FilesMatch>
<FilesMatch \.js\.gz$>
  ForceType application/javascript
  Header append Vary Accept-Encoding
</FilesMatch>
<FilesMatch \.html\.gz$>
  ForceType text/html
  Header append Vary Accept-Encoding
</FilesMatch>
```

```prolog
diff(plus(A,B), X, plus(DA, DB))
   <= diff(A, X, DA) and diff(B, X, DB).

diff(times(A,B), X, plus(times(A, DB), times(DA, B)))
   <= diff(A, X, DA) and diff(B, X, DB).

equal(X, X).
diff(X, X, 1).
diff(Y, X, 0) <= not equal(Y, X).
```

```ocaml
(* Binary tree with leaves car­rying an integer. *)
type tree = Leaf of int | Node of tree * tree

let rec exists_leaf test tree =
  match tree with
  | Leaf v -> test v
  | Node (left, right) ->
      exists_leaf test left
      || exists_leaf test right

let has_even_leaf tree =
  exists_leaf (fun n -> n mod 2 = 0) tree
```

```sql
SELECT * FROM `users` WHERE `user`.`id` = 1
```

```smalltalk
quadMultiply: i1 and: i2
    "This method multiplies the given numbers by each other
    and the result by 4."
    | mul |
    mul := i1 * i2.
    ^mul * 4
```

```racket
#lang racket

;; draw a graph of cos and deriv^3(cos)
(require plot)
(define ((deriv f) x)
  (/ (- (f x) (f (- x 0.001))) 0.001))
(define (thrice f) (lambda (x) (f (f (f x)))))
(plot (list (function ((thrice deriv) sin) -5 5)
            (function cos -5 5 #:color 'blue)))

;; Print the Greek alphabet
(for ([i (in-range 25)])
  (displayln
   (integer->char
    (+ i (char->integer #\u3B1)))))

;; An echo server
(define listener (tcp-listen 12345))
(let echo-server ()
  (define-values (in out) (tcp-accept listener))
  (thread (λ ()
             (copy-port in out)
             (close-output-port out)))
  (echo-server))
```

```puppet
service { 'ntp':
  name      => $service_name,
  ensure    => running,
  enable    => true,
  subscribe => File['ntp.conf'],
}
```

```dart
void main() {
  var collection=[1,2,3,4,5];
  for(var a in collection){
    print(a);
  }
}
```

```tcl
proc cross_sum {s} {expr [join [split $s ""] +]}
```

```csharp
// reverse byte order (16-bit)
public static UInt16 ReverseBytes(UInt16 value)
{
  return (UInt16)((value & 0xFFU) << 8 | (value & 0xFF00U) >> 8);
}
```

```vb
Private Sub Form_Load()
    ' Execute a simple message box that says "Hello, World!"
    MsgBox "Hello, World!"
End Sub
```

```python
def fib(n):    # write Fibonacci series up to n
    """Print a Fibonacci series up to n."""
    a, b = 0, 1
    while a < n:
        print a,
        a, b = b, a+b
```

```perl
#!/usr/bin/env perl
use warnings;
print "a: ";
my $a = "foo";
print $a;
```

```markdown
Markdown has cool [reference links][ref 1]
and [regular links too](https://example.com)

[ref 1]: https://example.com
```

```yaml
- name: set PHP-FPM parameters
  lineinfile:
    dest: /etc/php-fpm.conf
    regexp: "^{{ item.param }}"
    insertafter: "^;{{ item.param }}"
    line: "{{ item.param }} = {{ item.value }}"
  with_items:
    - { param: 'error_log', value: '/var/log/php-fpm/error.log' }
    - { param: 'log_level', value: 'error' }
    - { param: 'emergency_restart_threshold', value: '10' }
```
