import cpp

from FunctionCall calls
where calls.getTarget().getName() = "memcpy"
select calls