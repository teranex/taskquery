# taskquery

A simply query interface for Taskwarrior

## What it does
This script let's you on-the-fly specify which columns you want to see in a report and how the
result should be sorted. When you just want to create a simple custom report which you are going to
use once, this is much simpler then having to create a custom report, or specify all the rc-override
on the commandline.
This script simply rewrites the extra parameters to the correct rc-overrides.

## Interface
The following parameters can be used. All parameters are optional.

* `columns:`: used to specify which columns to display
* `labels:`: used to specify the labels for the columns. If this parameter is absent the column names
will be used as the labels
* `sort:`: specify how to sort the result. e.g.: `id+,description-`
* `report:`: which report to use. By default the `all` report will be used.

## Installation and usage
Simply checkout the repository. Make sure that you have *ruby* intalled. Then you can run the
script:

    /path/to/taskquery columns:id,description labels:ID,Desc proj:FooProject sort:id-

You can also add an alias in your `.taskrc`:

    alias.query=execute /path/to/taskquery

Then you can run it as follows:

    task query columns:id,project,description report:next sort:project+
