# Kenma

[WIP]Kenma( 研磨 ) is pluggable Question-Answer tool.

[![Build Status](https://travis-ci.org/tbpgr/kenma.png?branch=master)](https://travis-ci.org/tbpgr/kenma)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kenma'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kenma

## Usage
### <i class="fa fa-code" style="font-size:1em;"></i> Commands
|コマンド|動作|
|:--|:--|
|list|display question list. id, title and description.|
|show <question id>|display question detail.|
|cunning <question id>|display question detail and feedback.|
|polish <question id>|display question and prompt answer.|

#### <i class="fa fa-files-o" style="font-size:1em;"></i> `list`
問題リストを表示する

~~~bash
$ kenma list
1	Hello, world!
2	String#upcase
3	String#downcase
~~~

#### <i class="fa fa-file-o" style="font-size:1em;"></i> `show <question id>`

~~~bash
$ kenma show 1
title: Hello, world!

<空欄1> 'Hello, world!'
# => Hello, world!
空欄1 のコードを埋め 'Hello, world!' を標準出力してください。
※改行は出力しないでください。
~~~

#### <i class="fa fa-search-plus" style="font-size:1em;"></i> `cunning` <question id>

~~~bash
$ kenma cunning 1
title: Hello, world!

<空欄1> 'Hello, world!'
# => Hello, world!
空欄1 のコードを埋め 'Hello, world!' を標準出力してください。
※改行は出力しないでください。

答えは print です。( $><< でも可 )
~~~

#### <i class="fa fa-diamond" style="font-size:1em;"></i> `polish` <question id>
show question and input answer.

* question

~~~bash
$ kenma polish 1
title: Hello, world!

<空欄1> 'Hello, world!'
# => Hello, world!
空欄1 のコードを埋め 'Hello, world!' を標準出力してください。
※改行は出力しないでください。
> ※入力プロンプト
~~~

* answer(ok)

~~~bash
$ kenma polish 1
title: Hello, world!

<空欄1> 'Hello, world!'
# => Hello, world!
空欄1 のコードを埋め 'Hello, world!' を標準出力してください。
※改行は出力しないでください。
> ※入力プロンプト
> print
ok!
~~~

* answer(ng)

~~~bash
$ kenma polish 1
title: Hello, world!

<空欄1> 'Hello, world!'
# => Hello, world!
空欄1 のコードを埋め 'Hello, world!' を標準出力してください。
※改行は出力しないでください。
> ※入力プロンプト
> puts
ng!
~~~

## Contributing

1. Fork it ( https://github.com/tbpgr/kenma/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
