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
	 * Enter a parse tree produced by {@link ProgryParser#if}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterIf(_ ctx: ProgryParser.IfContext)
	/**
	 * Exit a parse tree produced by {@link ProgryParser#if}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitIf(_ ctx: ProgryParser.IfContext)
	/**
	 * Enter a parse tree produced by {@link ProgryParser#while}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterWhile(_ ctx: ProgryParser.WhileContext)
	/**
	 * Exit a parse tree produced by {@link ProgryParser#while}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitWhile(_ ctx: ProgryParser.WhileContext)
	/**
	 * Enter a parse tree produced by {@link ProgryParser#for}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFor(_ ctx: ProgryParser.ForContext)
	/**
	 * Exit a parse tree produced by {@link ProgryParser#for}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFor(_ ctx: ProgryParser.ForContext)
	/**
	 * Enter a parse tree produced by {@link ProgryParser#t_expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterT_expr(_ ctx: ProgryParser.T_exprContext)
	/**
	 * Exit a parse tree produced by {@link ProgryParser#t_expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitT_expr(_ ctx: ProgryParser.T_exprContext)
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