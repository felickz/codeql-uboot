import cpp

from Macro macro
where macro.getName() in ["ntohs", "ntohl", "ntohll"]
//where macro.getName().regexpMatch("ntohs|ntohl|ntohll")
select macro, macro.getName()
