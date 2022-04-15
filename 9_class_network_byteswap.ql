import cpp

class NetworkByteSwap extends Expr{
    NetworkByteSwap(){
    exists  ( MacroInvocation macroInvocation |
                macroInvocation.getMacroName() in ["ntohs", "ntohl", "ntohll"] and
                this = macroInvocation.getExpr()
            )
    }
}

from NetworkByteSwap networkByteSwap
select networkByteSwap, "Network Byte Swap"