Xeonlab LuaTeX Package
======================

This LuaTeX-Package provides some additional features to LuaTeX, fore example a class for invoicing.

Installation
------------

**For TeXLive-Users:**

1. Clone this repository into a `texmf`-Directory, e.g. your local user:
```bash
$ git clone https://github.com/xeonlab/luatex ~/texmf/tex/latex/xeonlab
```
*On Mac OSX you will need to clone into `~/Library/texmf/tex/latex/xeonlab` instead.*

2. Call `texhash` from the `texmf`-Directory you have chosen:
```bash
$ texhash ~/texmf
```

Features
--------

### **xeonlab-utilities**

Provides some fresh tools you can use in your application:
    
*objects:* You can easily group information together in an object, just introduce it with `\newobject{<name>}` and you can easily read and write information to it:
```tex
% Introduce object "sample"
\newobject{sample}

% Set value “bar” for key “foo”
\sample.foo: bar;

% Read value “foo”
I haz a \readsample[foo]! % “I haz a bar!”
```

### **xeonlab-invoice**

This class lets you easily create beautiful invoice pdf's. The class uses the “rechnung”-package by [M G Berberich] [1].
You can modify the values in the template by using objects:
- `from`: Information about the person sending the bill
- `to`: Information about the recipient of the bill
- `bank`: Detail about banking information
- `invoice`: Provides dates and a reference number

Example:
```tex
\documentclass[brand=2233FF]{xeonlab-invoice}
\usepackage[ngerman]{babel}

%% DETAIL ABOUT THE SENDER
%%===============================================
\from.name:        John Doe;
\from.kind:        Cool Stuff Ltd.;
\from.address:     Some street 1;
\from.zipcode:	   D-12345;
\from.city:        Some City;
\from.email:       john@doe.com;
\from.website:     www.example.com;
\from.phone:       +49 (0)40 123 456 78;
\from.mobile:      +49 (0)123 987 654 32;
\from.tax:         12/987/12345;

%% BANKING DETAIL
%%===============================================
\bank.iban:        DE12 3004 0500 0006 7891 23;
\bank.bic:         COOLBANK123;
\bank.name:        Cool Bank;
\bank.account:     678 91 23;
\bank.code:        300 40 500;

%% DETAIL ABOUT THE RECIPIENT
%%===============================================
\to.name:          Jane Doe;
\to.address:       Another street 42;
\to.zipcode:       D-12345;
\to.city:          Some City;

%% INVOICE
%%===============================================
\invoice.number:   2014-98765;
\invoice.created:  23.01.2014;
\invoice.due:      31.01.2014;

\begin{document}
  % Your positions here %
\end{document}
```

[1]: http://www.forwiss.uni-passau.de/~berberic/TeX/Rechnung/ "M G Berberich Rechnung package website"
