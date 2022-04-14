// via: https://github.com/felickz/codeql-uboot/issues/4
import cpp

from Function f
where f.getName() = "memcpy"
select f, "a function named strlen"
