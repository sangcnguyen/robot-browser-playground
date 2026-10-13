# robot-browser-playground

A playground for learning [Robot Framework](https://robotframework.org/) with the [Browser library](https://robotframework-browser.org/) (Playwright), using the [SauceDemo](https://www.saucedemo.com/) sample shop.

## Structure

```
resources/
  pages/    # page objects: locators and page-level keywords
  flows/    # user flows built from page keywords (auth, checkout)
tests/      # test suites
```

## Setup

Requires Python 3.13+ and [uv](https://docs.astral.sh/uv/).

```bash
uv sync
uv run rfbrowser init chromium
```

## Run

```bash
uv run robot -d results tests/
```

Lint with Robocop:

```bash
uv run robocop check
```
