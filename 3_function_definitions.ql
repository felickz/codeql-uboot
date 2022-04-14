// via: https://github.com/felickz/codeql-uboot/issues/3
import cpp

from Function f
where f.getName() = "strlen"
select f, "a function named strlen"
