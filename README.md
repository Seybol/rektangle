Rektangle by Seybol

Ruby script which will draw a rectangle.
Give it a height, a width and optionnaly the characters you want to use and it will draw a rectangle.
For more details:

```shell script
ruby ./rektangle --help
```

```shell script
bundle install
```

For example:
```shell script
ruby ./rektangle 4 5
```
or
```shell script
ruby ./rektangle 6 9 o o o o -
```
Be carefull with special characters:
```shell script
ruby ./rektangle.rb 10 3 \/ \\ \/ \\ \*
```
