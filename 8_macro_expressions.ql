import cpp

from MacroInvocation macroInvocation
where macroInvocation.getMacroName() in ["ntohs", "ntohl", "ntohll"]
select macroInvocation.getExpr() //Note: An expression is a source code element that can have a value at runtime. Invoking a macro can bring various source code elements into scope, including expressions.