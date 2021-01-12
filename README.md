# linguee-alfred-workflow

## Download

You need Alfred Powerpack to use this workflow.

Click [here](https://github.com/geekdada/linguee-alfred-workflow/releases/latest/download/alfred.alfredworkflow) to download the latest version of the workflow.

## Usage

Use keyword to initiate a query.

![CleanShot 2021-01-12 at 14.51.18@2x.png](https://i.loli.net/2021/01/12/B6sInMZTmS2dfCa.png)

You can add new languages by creating new "Script Filter".

```
./linguee "$(iconv -f UTF8-MAC <<<"{query}")" [source language]-[target language]
```

![CleanShot 2021-01-12 at 14.52.44@2x.png](https://i.loli.net/2021/01/12/QqMLPzRUIyVlprB.png)

Just keep one thing in mind, either the source language or the target language is supported by Linguee.