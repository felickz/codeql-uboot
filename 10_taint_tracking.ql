/**
 * @kind path-problem
 */

import cpp
import semmle.code.cpp.dataflow.TaintTracking
import DataFlow::PathGraph

class NetworkByteSwap extends Expr{
    NetworkByteSwap(){
    exists  ( MacroInvocation macroInvocation |
                macroInvocation.getMacroName() in ["ntohs", "ntohl", "ntohll"] and
                this = macroInvocation.getExpr()
            )
    }
}

class Config extends TaintTracking::Configuration {
  Config() { this = "NetworkToMemFuncLength" }

  //recognize an expression in an invocation of ntohl, ntohs or ntohll
  override predicate isSource(DataFlow::Node source) {
    source.asExpr() instanceof NetworkByteSwap
  }

  //size argument of calls to memcpy
  override predicate isSink(DataFlow::Node sink) {
    exists(FunctionCall functionCall | 
        functionCall.getTarget().getName() = "memcpy" and
      functionCall.getArgument(2) = sink.asExpr()
    )
  }
}

from Config cfg, DataFlow::PathNode source, DataFlow::PathNode sink
where cfg.hasFlowPath(source, sink)
select sink, source, sink, "Network byte swap flows to memcpy"
