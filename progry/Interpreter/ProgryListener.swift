// Generated from Progry.g4 by ANTLR 4.10
import Antlr4

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link ProgryParser}.
 */
public protocol ProgryListener: ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link ProgryParser#program}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterProgram(_ ctx: ProgryParser.ProgramContext)
	/**
	 * Exit a parse tree produced by {@link ProgryParser#program}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitProgram(_ ctx: ProgryParser.ProgramContext)
	/**
	 * Enter a parse tree produced by {@link ProgryParser#main}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterMain(_ ctx: ProgryParser.MainContext)
	/**
	 * Exit a parse tree produced by {@link ProgryParser#main}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitMain(_ ctx: ProgryParser.MainContext)
	/**
	 * Enter a parse tree produced by {@link ProgryParser#module}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterModule(_ ctx: ProgryParser.ModuleContext)
	/**
	 * Exit a parse tree produced by {@link ProgryParser#module}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitModule(_ ctx: ProgryParser.ModuleContext)
	/**
	 * Enter a parse tree produced by {@link ProgryParser#type}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterType(_ ctx: ProgryParser.TypeContext)
	/**
	 * Exit a parse tree produced by {@link ProgryParser#type}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitType(_ ctx: ProgryParser.TypeContext)
	/**
	 * Enter a parse tree produced by {@link ProgryParser#cte}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterCte(_ ctx: ProgryParser.CteContext)
	/**
	 * Exit a parse tree produced by {@link ProgryParser#cte}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitCte(_ ctx: ProgryParser.CteContext)
	/**
	 * Enter a parse tree produced by {@link ProgryParser#statute}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterStatute(_ ctx: ProgryParser.StatuteContext)
	/**
	 * Exit a parse tree produced by {@link ProgryParser#statute}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitStatute(_ ctx: ProgryParser.StatuteContext)
	/**
	 * Enter a parse tree produced by {@link ProgryParser#asignation}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterAsignation(_ ctx: ProgryParser.AsignationContext)
	/**
	 * Exit a parse tree produced by {@link ProgryParser#asignation}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitAsignation(_ ctx: ProgryParser.AsignationContext)
	/**
	 * Enter a parse tree produced by {@link ProgryParser#read}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterRead(_ ctx: ProgryParser.ReadContext)
	/**
	 * Exit a parse tree produced by {@link ProgryParser#read}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitRead(_ ctx: ProgryParser.ReadContext)
	/**
	 * Enter a parse tree produced by {@link ProgryParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterExpr(_ ctx: ProgryParser.ExprContext)
	/**
	 * Exit a parse tree produced by {@link ProgryParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitExpr(_ ctx: ProgryParser.ExprContext)
	/**
	 * Enter a parse tree produced by {@link ProgryParser#vars}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterVars(_ ctx: ProgryParser.VarsContext)
	/**
	 * Exit a parse tree produced by {@link ProgryParser#vars}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitVars(_ ctx: ProgryParser.VarsContext)
	/**
	 * Enter a parse tree produced by {@link ProgryParser#write}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterWrite(_ ctx: ProgryParser.WriteContext)
	/**
	 * Exit a parse tree produced by {@link ProgryParser#write}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitWrite(_ ctx: ProgryParser.WriteContext)
	/**
	 * Enter a parse tree produced by {@link ProgryParser#arrays}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterArrays(_ ctx: ProgryParser.ArraysContext)
	/**
	 * Exit a parse tree produced by {@link ProgryParser#arrays}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitArrays(_ ctx: ProgryParser.ArraysContext)
	/**
	 * Enter a parse tree produced by {@link ProgryParser#ifs}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterIfs(_ ctx: ProgryParser.IfsContext)
	/**
	 * Exit a parse tree produced by {@link ProgryParser#ifs}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitIfs(_ ctx: ProgryParser.IfsContext)
	/**
	 * Enter a parse tree produced by {@link ProgryParser#whiles}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterWhiles(_ ctx: ProgryParser.WhilesContext)
	/**
	 * Exit a parse tree produced by {@link ProgryParser#whiles}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitWhiles(_ ctx: ProgryParser.WhilesContext)
	/**
	 * Enter a parse tree produced by {@link ProgryParser#dos}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterDos(_ ctx: ProgryParser.DosContext)
	/**
	 * Exit a parse tree produced by {@link ProgryParser#dos}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitDos(_ ctx: ProgryParser.DosContext)
	/**
	 * Enter a parse tree produced by {@link ProgryParser#fors}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFors(_ ctx: ProgryParser.ForsContext)
	/**
	 * Exit a parse tree produced by {@link ProgryParser#fors}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFors(_ ctx: ProgryParser.ForsContext)
	/**
	 * Enter a parse tree produced by {@link ProgryParser#module_call}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterModule_call(_ ctx: ProgryParser.Module_callContext)
	/**
	 * Exit a parse tree produced by {@link ProgryParser#module_call}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitModule_call(_ ctx: ProgryParser.Module_callContext)
	/**
	 * Enter a parse tree produced by {@link ProgryParser#g_expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterG_expr(_ ctx: ProgryParser.G_exprContext)
	/**
	 * Exit a parse tree produced by {@link ProgryParser#g_expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitG_expr(_ ctx: ProgryParser.G_exprContext)
	/**
	 * Enter a parse tree produced by {@link ProgryParser#m_expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterM_expr(_ ctx: ProgryParser.M_exprContext)
	/**
	 * Exit a parse tree produced by {@link ProgryParser#m_expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitM_expr(_ ctx: ProgryParser.M_exprContext)
	/**
	 * Enter a parse tree produced by {@link ProgryParser#t}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterT(_ ctx: ProgryParser.TContext)
	/**
	 * Exit a parse tree produced by {@link ProgryParser#t}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitT(_ ctx: ProgryParser.TContext)
	/**
	 * Enter a parse tree produced by {@link ProgryParser#f}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterF(_ ctx: ProgryParser.FContext)
	/**
	 * Exit a parse tree produced by {@link ProgryParser#f}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitF(_ ctx: ProgryParser.FContext)
}