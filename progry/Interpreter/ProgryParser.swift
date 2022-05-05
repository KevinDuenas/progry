// Generated from Progry.g4 by ANTLR 4.10
import Antlr4

open class ProgryParser: Parser {

	internal static var _decisionToDFA: [DFA] = {
          var decisionToDFA = [DFA]()
          let length = ProgryParser._ATN.getNumberOfDecisions()
          for i in 0..<length {
            decisionToDFA.append(DFA(ProgryParser._ATN.getDecisionState(i)!, i))
           }
           return decisionToDFA
     }()

	internal static let _sharedContextCache = PredictionContextCache()

	public
	enum Tokens: Int {
		case EOF = -1, PLUS = 1, MINUS = 2, MULT = 3, DIV = 4, EQUAL = 5, OR = 6, 
                 AND = 7, MORE_THAN = 8, LESS_THEN = 9, MORE_AND_THAN = 10, 
                 LESS_AND_THAN = 11, EQUAL_THAN = 12, DIFERENT_THAN = 13, 
                 OPEN_PARENTHESIS = 14, CLOSE_PARENTHESIS = 15, OPEN_BRACKET = 16, 
                 CLOSE_BRACKET = 17, OPEN_SBRACKET = 18, CLOSE_SBRACKET = 19, 
                 MODULE = 20, MAIN = 21, ARRAY = 22, PROGRAM_START = 23, 
                 PROGRAM_END = 24, DOT_COMMA = 25, COMMA = 26, VAR = 27, 
                 NUMBER_TYPE = 28, DECIMAL_TYPE = 29, TEXT_TYPE = 30, FLAG_TYPE = 31, 
                 READ = 32, WRITE = 33, IF = 34, ELSE = 35, FOR = 36, WHILE = 37, 
                 DO = 38, TO = 39, ID = 40, NUMBER = 41, DECIMAL = 42, TEXT = 43, 
                 FLAG = 44, WS = 45
	}

	public
	static let RULE_program = 0, RULE_main = 1, RULE_module = 2, RULE_type = 3, 
            RULE_cte = 4, RULE_statute = 5, RULE_asignation = 6, RULE_read = 7, 
            RULE_expr = 8, RULE_vars = 9, RULE_write = 10, RULE_arrays = 11, 
            RULE_if = 12, RULE_while = 13, RULE_for = 14, RULE_t_expr = 15, 
            RULE_g_expr = 16, RULE_m_expr = 17, RULE_t = 18, RULE_f = 19

	public
	static let ruleNames: [String] = [
		"program", "main", "module", "type", "cte", "statute", "asignation", "read", 
		"expr", "vars", "write", "arrays", "if", "while", "for", "t_expr", "g_expr", 
		"m_expr", "t", "f"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, "'+'", "'-'", "'*'", "'/'", "'='", "'||'", "'&'", "'>'", "'<'", "'>='", 
		"'<='", "'=='", "'!='", "'('", "')'", "'{'", "'}'", "'['", "']'", "'module'", 
		"'main'", "'array'", "'PROGRAM_START'", "'PROGRAM_END'", "';'", "','", 
		"'var'", "'number'", "'decimal'", "'text'", "'flag'", "'read'", "'write'", 
		"'if'", "'else'", "'for'", "'while'", "'do'", "'to'"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, "PLUS", "MINUS", "MULT", "DIV", "EQUAL", "OR", "AND", "MORE_THAN", 
		"LESS_THEN", "MORE_AND_THAN", "LESS_AND_THAN", "EQUAL_THAN", "DIFERENT_THAN", 
		"OPEN_PARENTHESIS", "CLOSE_PARENTHESIS", "OPEN_BRACKET", "CLOSE_BRACKET", 
		"OPEN_SBRACKET", "CLOSE_SBRACKET", "MODULE", "MAIN", "ARRAY", "PROGRAM_START", 
		"PROGRAM_END", "DOT_COMMA", "COMMA", "VAR", "NUMBER_TYPE", "DECIMAL_TYPE", 
		"TEXT_TYPE", "FLAG_TYPE", "READ", "WRITE", "IF", "ELSE", "FOR", "WHILE", 
		"DO", "TO", "ID", "NUMBER", "DECIMAL", "TEXT", "FLAG", "WS"
	]
	public
	static let VOCABULARY = Vocabulary(_LITERAL_NAMES, _SYMBOLIC_NAMES)

	override open
	func getGrammarFileName() -> String { return "Progry.g4" }

	override open
	func getRuleNames() -> [String] { return ProgryParser.ruleNames }

	override open
	func getSerializedATN() -> [Int] { return ProgryParser._serializedATN }

	override open
	func getATN() -> ATN { return ProgryParser._ATN }


	override open
	func getVocabulary() -> Vocabulary {
	    return ProgryParser.VOCABULARY
	}

	override public
	init(_ input:TokenStream) throws {
	    RuntimeMetaData.checkVersion("4.10", RuntimeMetaData.VERSION)
		try super.init(input)
		_interp = ParserATNSimulator(self,ProgryParser._ATN,ProgryParser._decisionToDFA, ProgryParser._sharedContextCache)
	}


	public class ProgramContext: ParserRuleContext {
			open
			func PROGRAM_START() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.PROGRAM_START.rawValue, 0)
			}
			open
			func DOT_COMMA() -> [TerminalNode] {
				return getTokens(ProgryParser.Tokens.DOT_COMMA.rawValue)
			}
			open
			func DOT_COMMA(_ i:Int) -> TerminalNode? {
				return getToken(ProgryParser.Tokens.DOT_COMMA.rawValue, i)
			}
			open
			func main() -> MainContext? {
				return getRuleContext(MainContext.self, 0)
			}
			open
			func PROGRAM_END() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.PROGRAM_END.rawValue, 0)
			}
			open
			func EOF() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.EOF.rawValue, 0)
			}
			open
			func vars() -> [VarsContext] {
				return getRuleContexts(VarsContext.self)
			}
			open
			func vars(_ i: Int) -> VarsContext? {
				return getRuleContext(VarsContext.self, i)
			}
			open
			func module() -> [ModuleContext] {
				return getRuleContexts(ModuleContext.self)
			}
			open
			func module(_ i: Int) -> ModuleContext? {
				return getRuleContext(ModuleContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ProgryParser.RULE_program
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.enterProgram(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.exitProgram(self)
			}
		}
	}
	@discardableResult
	 open func program() throws -> ProgramContext {
		var _localctx: ProgramContext
		_localctx = ProgramContext(_ctx, getState())
		try enterRule(_localctx, 0, ProgryParser.RULE_program)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(40)
		 	try match(ProgryParser.Tokens.PROGRAM_START.rawValue)
		 	setState(41)
		 	try match(ProgryParser.Tokens.DOT_COMMA.rawValue)
		 	setState(47)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == ProgryParser.Tokens.VAR.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(43) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(42)
		 			try vars()


		 			setState(45); 
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		} while (//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == ProgryParser.Tokens.VAR.rawValue
		 		      return testSet
		 		 }())

		 	}

		 	setState(54)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == ProgryParser.Tokens.MODULE.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(50) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(49)
		 			try module()


		 			setState(52); 
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		} while (//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == ProgryParser.Tokens.MODULE.rawValue
		 		      return testSet
		 		 }())

		 	}

		 	setState(56)
		 	try main()
		 	setState(57)
		 	try match(ProgryParser.Tokens.PROGRAM_END.rawValue)
		 	setState(58)
		 	try match(ProgryParser.Tokens.DOT_COMMA.rawValue)
		 	setState(59)
		 	try match(ProgryParser.Tokens.EOF.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class MainContext: ParserRuleContext {
			open
			func MAIN() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.MAIN.rawValue, 0)
			}
			open
			func OPEN_BRACKET() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.OPEN_BRACKET.rawValue, 0)
			}
			open
			func CLOSE_BRACKET() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.CLOSE_BRACKET.rawValue, 0)
			}
			open
			func statute() -> [StatuteContext] {
				return getRuleContexts(StatuteContext.self)
			}
			open
			func statute(_ i: Int) -> StatuteContext? {
				return getRuleContext(StatuteContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ProgryParser.RULE_main
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.enterMain(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.exitMain(self)
			}
		}
	}
	@discardableResult
	 open func main() throws -> MainContext {
		var _localctx: MainContext
		_localctx = MainContext(_ctx, getState())
		try enterRule(_localctx, 2, ProgryParser.RULE_main)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(61)
		 	try match(ProgryParser.Tokens.MAIN.rawValue)
		 	setState(62)
		 	try match(ProgryParser.Tokens.OPEN_BRACKET.rawValue)
		 	setState(64) 
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	repeat {
		 		setState(63)
		 		try statute()


		 		setState(66); 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	} while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, ProgryParser.Tokens.OPEN_PARENTHESIS.rawValue,ProgryParser.Tokens.ARRAY.rawValue,ProgryParser.Tokens.VAR.rawValue,ProgryParser.Tokens.READ.rawValue,ProgryParser.Tokens.WRITE.rawValue,ProgryParser.Tokens.IF.rawValue,ProgryParser.Tokens.FOR.rawValue,ProgryParser.Tokens.WHILE.rawValue,ProgryParser.Tokens.ID.rawValue,ProgryParser.Tokens.NUMBER.rawValue,ProgryParser.Tokens.DECIMAL.rawValue,ProgryParser.Tokens.TEXT.rawValue,ProgryParser.Tokens.FLAG.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }())
		 	setState(68)
		 	try match(ProgryParser.Tokens.CLOSE_BRACKET.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ModuleContext: ParserRuleContext {
			open
			func MODULE() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.MODULE.rawValue, 0)
			}
			open
			func ID() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.ID.rawValue, 0)
			}
			open
			func OPEN_BRACKET() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.OPEN_BRACKET.rawValue, 0)
			}
			open
			func CLOSE_BRACKET() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.CLOSE_BRACKET.rawValue, 0)
			}
			open
			func statute() -> [StatuteContext] {
				return getRuleContexts(StatuteContext.self)
			}
			open
			func statute(_ i: Int) -> StatuteContext? {
				return getRuleContext(StatuteContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ProgryParser.RULE_module
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.enterModule(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.exitModule(self)
			}
		}
	}
	@discardableResult
	 open func module() throws -> ModuleContext {
		var _localctx: ModuleContext
		_localctx = ModuleContext(_ctx, getState())
		try enterRule(_localctx, 4, ProgryParser.RULE_module)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(70)
		 	try match(ProgryParser.Tokens.MODULE.rawValue)
		 	setState(71)
		 	try match(ProgryParser.Tokens.ID.rawValue)
		 	setState(72)
		 	try match(ProgryParser.Tokens.OPEN_BRACKET.rawValue)
		 	setState(76)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, ProgryParser.Tokens.OPEN_PARENTHESIS.rawValue,ProgryParser.Tokens.ARRAY.rawValue,ProgryParser.Tokens.VAR.rawValue,ProgryParser.Tokens.READ.rawValue,ProgryParser.Tokens.WRITE.rawValue,ProgryParser.Tokens.IF.rawValue,ProgryParser.Tokens.FOR.rawValue,ProgryParser.Tokens.WHILE.rawValue,ProgryParser.Tokens.ID.rawValue,ProgryParser.Tokens.NUMBER.rawValue,ProgryParser.Tokens.DECIMAL.rawValue,ProgryParser.Tokens.TEXT.rawValue,ProgryParser.Tokens.FLAG.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(73)
		 		try statute()


		 		setState(78)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(79)
		 	try match(ProgryParser.Tokens.CLOSE_BRACKET.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TypeContext: ParserRuleContext {
			open
			func NUMBER_TYPE() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.NUMBER_TYPE.rawValue, 0)
			}
			open
			func DECIMAL_TYPE() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.DECIMAL_TYPE.rawValue, 0)
			}
			open
			func TEXT_TYPE() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.TEXT_TYPE.rawValue, 0)
			}
			open
			func FLAG_TYPE() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.FLAG_TYPE.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ProgryParser.RULE_type
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.enterType(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.exitType(self)
			}
		}
	}
	@discardableResult
	 open func type() throws -> TypeContext {
		var _localctx: TypeContext
		_localctx = TypeContext(_ctx, getState())
		try enterRule(_localctx, 6, ProgryParser.RULE_type)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(81)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, ProgryParser.Tokens.NUMBER_TYPE.rawValue,ProgryParser.Tokens.DECIMAL_TYPE.rawValue,ProgryParser.Tokens.TEXT_TYPE.rawValue,ProgryParser.Tokens.FLAG_TYPE.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class CteContext: ParserRuleContext {
			open
			func NUMBER() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.NUMBER.rawValue, 0)
			}
			open
			func DECIMAL() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.DECIMAL.rawValue, 0)
			}
			open
			func TEXT() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.TEXT.rawValue, 0)
			}
			open
			func FLAG() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.FLAG.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ProgryParser.RULE_cte
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.enterCte(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.exitCte(self)
			}
		}
	}
	@discardableResult
	 open func cte() throws -> CteContext {
		var _localctx: CteContext
		_localctx = CteContext(_ctx, getState())
		try enterRule(_localctx, 8, ProgryParser.RULE_cte)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(83)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, ProgryParser.Tokens.NUMBER.rawValue,ProgryParser.Tokens.DECIMAL.rawValue,ProgryParser.Tokens.TEXT.rawValue,ProgryParser.Tokens.FLAG.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class StatuteContext: ParserRuleContext {
			open
			func asignation() -> AsignationContext? {
				return getRuleContext(AsignationContext.self, 0)
			}
			open
			func read() -> ReadContext? {
				return getRuleContext(ReadContext.self, 0)
			}
			open
			func expr() -> ExprContext? {
				return getRuleContext(ExprContext.self, 0)
			}
			open
			func vars() -> VarsContext? {
				return getRuleContext(VarsContext.self, 0)
			}
			open
			func write() -> WriteContext? {
				return getRuleContext(WriteContext.self, 0)
			}
			open
			func arrays() -> ArraysContext? {
				return getRuleContext(ArraysContext.self, 0)
			}
			open
			func `if`() -> IfContext? {
				return getRuleContext(IfContext.self, 0)
			}
			open
			func `while`() -> WhileContext? {
				return getRuleContext(WhileContext.self, 0)
			}
			open
			func `for`() -> ForContext? {
				return getRuleContext(ForContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ProgryParser.RULE_statute
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.enterStatute(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.exitStatute(self)
			}
		}
	}
	@discardableResult
	 open func statute() throws -> StatuteContext {
		var _localctx: StatuteContext
		_localctx = StatuteContext(_ctx, getState())
		try enterRule(_localctx, 10, ProgryParser.RULE_statute)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(94)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,6, _ctx)) {
		 	case 1:
		 		setState(85)
		 		try asignation()

		 		break
		 	case 2:
		 		setState(86)
		 		try read()

		 		break
		 	case 3:
		 		setState(87)
		 		try expr()

		 		break
		 	case 4:
		 		setState(88)
		 		try vars()

		 		break
		 	case 5:
		 		setState(89)
		 		try write()

		 		break
		 	case 6:
		 		setState(90)
		 		try arrays()

		 		break
		 	case 7:
		 		setState(91)
		 		try `if`()

		 		break
		 	case 8:
		 		setState(92)
		 		try `while`()

		 		break
		 	case 9:
		 		setState(93)
		 		try `for`()

		 		break
		 	default: break
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class AsignationContext: ParserRuleContext {
			open
			func ID() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.ID.rawValue, 0)
			}
			open
			func EQUAL() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.EQUAL.rawValue, 0)
			}
			open
			func m_expr() -> M_exprContext? {
				return getRuleContext(M_exprContext.self, 0)
			}
			open
			func DOT_COMMA() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.DOT_COMMA.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ProgryParser.RULE_asignation
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.enterAsignation(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.exitAsignation(self)
			}
		}
	}
	@discardableResult
	 open func asignation() throws -> AsignationContext {
		var _localctx: AsignationContext
		_localctx = AsignationContext(_ctx, getState())
		try enterRule(_localctx, 12, ProgryParser.RULE_asignation)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(96)
		 	try match(ProgryParser.Tokens.ID.rawValue)
		 	setState(97)
		 	try match(ProgryParser.Tokens.EQUAL.rawValue)
		 	setState(98)
		 	try m_expr()
		 	setState(99)
		 	try match(ProgryParser.Tokens.DOT_COMMA.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ReadContext: ParserRuleContext {
			open
			func READ() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.READ.rawValue, 0)
			}
			open
			func ID() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.ID.rawValue, 0)
			}
			open
			func DOT_COMMA() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.DOT_COMMA.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ProgryParser.RULE_read
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.enterRead(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.exitRead(self)
			}
		}
	}
	@discardableResult
	 open func read() throws -> ReadContext {
		var _localctx: ReadContext
		_localctx = ReadContext(_ctx, getState())
		try enterRule(_localctx, 14, ProgryParser.RULE_read)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(101)
		 	try match(ProgryParser.Tokens.READ.rawValue)
		 	setState(102)
		 	try match(ProgryParser.Tokens.ID.rawValue)
		 	setState(103)
		 	try match(ProgryParser.Tokens.DOT_COMMA.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ExprContext: ParserRuleContext {
			open
			func t_expr() -> [T_exprContext] {
				return getRuleContexts(T_exprContext.self)
			}
			open
			func t_expr(_ i: Int) -> T_exprContext? {
				return getRuleContext(T_exprContext.self, i)
			}
			open
			func OR() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.OR.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ProgryParser.RULE_expr
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.enterExpr(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.exitExpr(self)
			}
		}
	}
	@discardableResult
	 open func expr() throws -> ExprContext {
		var _localctx: ExprContext
		_localctx = ExprContext(_ctx, getState())
		try enterRule(_localctx, 16, ProgryParser.RULE_expr)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(110)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,7, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(105)
		 		try t_expr()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(106)
		 		try t_expr()
		 		setState(107)
		 		try match(ProgryParser.Tokens.OR.rawValue)
		 		setState(108)
		 		try t_expr()

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class VarsContext: ParserRuleContext {
			open
			func DOT_COMMA() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.DOT_COMMA.rawValue, 0)
			}
			open
			func VAR() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.VAR.rawValue, 0)
			}
			open
			func type() -> TypeContext? {
				return getRuleContext(TypeContext.self, 0)
			}
			open
			func ID() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.ID.rawValue, 0)
			}
			open
			func COMMA() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.COMMA.rawValue, 0)
			}
			open
			func vars() -> VarsContext? {
				return getRuleContext(VarsContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ProgryParser.RULE_vars
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.enterVars(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.exitVars(self)
			}
		}
	}
	@discardableResult
	 open func vars() throws -> VarsContext {
		var _localctx: VarsContext
		_localctx = VarsContext(_ctx, getState())
		try enterRule(_localctx, 18, ProgryParser.RULE_vars)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(122)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,8, _ctx)) {
		 	case 1:
		 		setState(112)
		 		try match(ProgryParser.Tokens.VAR.rawValue)
		 		setState(113)
		 		try type()
		 		setState(114)
		 		try match(ProgryParser.Tokens.ID.rawValue)

		 		break
		 	case 2:
		 		setState(116)
		 		try match(ProgryParser.Tokens.VAR.rawValue)
		 		setState(117)
		 		try type()
		 		setState(118)
		 		try match(ProgryParser.Tokens.ID.rawValue)
		 		setState(119)
		 		try match(ProgryParser.Tokens.COMMA.rawValue)
		 		setState(120)
		 		try vars()

		 		break
		 	default: break
		 	}
		 	setState(124)
		 	try match(ProgryParser.Tokens.DOT_COMMA.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class WriteContext: ParserRuleContext {
			open
			func WRITE() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.WRITE.rawValue, 0)
			}
			open
			func OPEN_PARENTHESIS() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.OPEN_PARENTHESIS.rawValue, 0)
			}
			open
			func CLOSE_PARENTHESIS() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.CLOSE_PARENTHESIS.rawValue, 0)
			}
			open
			func DOT_COMMA() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.DOT_COMMA.rawValue, 0)
			}
			open
			func m_expr() -> [M_exprContext] {
				return getRuleContexts(M_exprContext.self)
			}
			open
			func m_expr(_ i: Int) -> M_exprContext? {
				return getRuleContext(M_exprContext.self, i)
			}
			open
			func cte() -> [CteContext] {
				return getRuleContexts(CteContext.self)
			}
			open
			func cte(_ i: Int) -> CteContext? {
				return getRuleContext(CteContext.self, i)
			}
			open
			func ID() -> [TerminalNode] {
				return getTokens(ProgryParser.Tokens.ID.rawValue)
			}
			open
			func ID(_ i:Int) -> TerminalNode? {
				return getToken(ProgryParser.Tokens.ID.rawValue, i)
			}
			open
			func COMMA() -> [TerminalNode] {
				return getTokens(ProgryParser.Tokens.COMMA.rawValue)
			}
			open
			func COMMA(_ i:Int) -> TerminalNode? {
				return getToken(ProgryParser.Tokens.COMMA.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ProgryParser.RULE_write
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.enterWrite(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.exitWrite(self)
			}
		}
	}
	@discardableResult
	 open func write() throws -> WriteContext {
		var _localctx: WriteContext
		_localctx = WriteContext(_ctx, getState())
		try enterRule(_localctx, 20, ProgryParser.RULE_write)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(126)
		 	try match(ProgryParser.Tokens.WRITE.rawValue)
		 	setState(127)
		 	try match(ProgryParser.Tokens.OPEN_PARENTHESIS.rawValue)
		 	setState(131)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,9, _ctx)) {
		 	case 1:
		 		setState(128)
		 		try m_expr()

		 		break
		 	case 2:
		 		setState(129)
		 		try cte()

		 		break
		 	case 3:
		 		setState(130)
		 		try match(ProgryParser.Tokens.ID.rawValue)

		 		break
		 	default: break
		 	}
		 	setState(143)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == ProgryParser.Tokens.COMMA.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(133)
		 		try match(ProgryParser.Tokens.COMMA.rawValue)
		 		setState(137) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(137)
		 			try _errHandler.sync(self)
		 			switch(try getInterpreter().adaptivePredict(_input,10, _ctx)) {
		 			case 1:
		 				setState(134)
		 				try m_expr()

		 				break
		 			case 2:
		 				setState(135)
		 				try cte()

		 				break
		 			case 3:
		 				setState(136)
		 				try match(ProgryParser.Tokens.ID.rawValue)

		 				break
		 			default: break
		 			}

		 			setState(139); 
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		} while (//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, ProgryParser.Tokens.OPEN_PARENTHESIS.rawValue,ProgryParser.Tokens.ID.rawValue,ProgryParser.Tokens.NUMBER.rawValue,ProgryParser.Tokens.DECIMAL.rawValue,ProgryParser.Tokens.TEXT.rawValue,ProgryParser.Tokens.FLAG.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 0)
		 		}()
		 		      return testSet
		 		 }())


		 		setState(145)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(146)
		 	try match(ProgryParser.Tokens.CLOSE_PARENTHESIS.rawValue)
		 	setState(147)
		 	try match(ProgryParser.Tokens.DOT_COMMA.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ArraysContext: ParserRuleContext {
			open
			func ARRAY() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.ARRAY.rawValue, 0)
			}
			open
			func type() -> TypeContext? {
				return getRuleContext(TypeContext.self, 0)
			}
			open
			func OPEN_PARENTHESIS() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.OPEN_PARENTHESIS.rawValue, 0)
			}
			open
			func cte() -> [CteContext] {
				return getRuleContexts(CteContext.self)
			}
			open
			func cte(_ i: Int) -> CteContext? {
				return getRuleContext(CteContext.self, i)
			}
			open
			func CLOSE_PARENTHESIS() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.CLOSE_PARENTHESIS.rawValue, 0)
			}
			open
			func COMMA() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.COMMA.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ProgryParser.RULE_arrays
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.enterArrays(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.exitArrays(self)
			}
		}
	}
	@discardableResult
	 open func arrays() throws -> ArraysContext {
		var _localctx: ArraysContext
		_localctx = ArraysContext(_ctx, getState())
		try enterRule(_localctx, 22, ProgryParser.RULE_arrays)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(149)
		 	try match(ProgryParser.Tokens.ARRAY.rawValue)
		 	setState(150)
		 	try type()
		 	setState(151)
		 	try match(ProgryParser.Tokens.OPEN_PARENTHESIS.rawValue)
		 	setState(152)
		 	try cte()

		 	setState(153)
		 	try match(ProgryParser.Tokens.COMMA.rawValue)
		 	setState(157)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, ProgryParser.Tokens.NUMBER.rawValue,ProgryParser.Tokens.DECIMAL.rawValue,ProgryParser.Tokens.TEXT.rawValue,ProgryParser.Tokens.FLAG.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(154)
		 		try cte()


		 		setState(159)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}

		 	setState(160)
		 	try match(ProgryParser.Tokens.CLOSE_PARENTHESIS.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class IfContext: ParserRuleContext {
			open
			func IF() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.IF.rawValue, 0)
			}
			open
			func OPEN_PARENTHESIS() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.OPEN_PARENTHESIS.rawValue, 0)
			}
			open
			func expr() -> ExprContext? {
				return getRuleContext(ExprContext.self, 0)
			}
			open
			func CLOSE_PARENTHESIS() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.CLOSE_PARENTHESIS.rawValue, 0)
			}
			open
			func OPEN_BRACKET() -> [TerminalNode] {
				return getTokens(ProgryParser.Tokens.OPEN_BRACKET.rawValue)
			}
			open
			func OPEN_BRACKET(_ i:Int) -> TerminalNode? {
				return getToken(ProgryParser.Tokens.OPEN_BRACKET.rawValue, i)
			}
			open
			func CLOSE_BRACKET() -> [TerminalNode] {
				return getTokens(ProgryParser.Tokens.CLOSE_BRACKET.rawValue)
			}
			open
			func CLOSE_BRACKET(_ i:Int) -> TerminalNode? {
				return getToken(ProgryParser.Tokens.CLOSE_BRACKET.rawValue, i)
			}
			open
			func statute() -> [StatuteContext] {
				return getRuleContexts(StatuteContext.self)
			}
			open
			func statute(_ i: Int) -> StatuteContext? {
				return getRuleContext(StatuteContext.self, i)
			}
			open
			func ELSE() -> [TerminalNode] {
				return getTokens(ProgryParser.Tokens.ELSE.rawValue)
			}
			open
			func ELSE(_ i:Int) -> TerminalNode? {
				return getToken(ProgryParser.Tokens.ELSE.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ProgryParser.RULE_if
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.enterIf(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.exitIf(self)
			}
		}
	}
	@discardableResult
	 open func `if`() throws -> IfContext {
		var _localctx: IfContext
		_localctx = IfContext(_ctx, getState())
		try enterRule(_localctx, 24, ProgryParser.RULE_if)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(162)
		 	try match(ProgryParser.Tokens.IF.rawValue)
		 	setState(163)
		 	try match(ProgryParser.Tokens.OPEN_PARENTHESIS.rawValue)
		 	setState(164)
		 	try expr()
		 	setState(165)
		 	try match(ProgryParser.Tokens.CLOSE_PARENTHESIS.rawValue)
		 	setState(166)
		 	try match(ProgryParser.Tokens.OPEN_BRACKET.rawValue)
		 	setState(170)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, ProgryParser.Tokens.OPEN_PARENTHESIS.rawValue,ProgryParser.Tokens.ARRAY.rawValue,ProgryParser.Tokens.VAR.rawValue,ProgryParser.Tokens.READ.rawValue,ProgryParser.Tokens.WRITE.rawValue,ProgryParser.Tokens.IF.rawValue,ProgryParser.Tokens.FOR.rawValue,ProgryParser.Tokens.WHILE.rawValue,ProgryParser.Tokens.ID.rawValue,ProgryParser.Tokens.NUMBER.rawValue,ProgryParser.Tokens.DECIMAL.rawValue,ProgryParser.Tokens.TEXT.rawValue,ProgryParser.Tokens.FLAG.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(167)
		 		try statute()


		 		setState(172)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(173)
		 	try match(ProgryParser.Tokens.CLOSE_BRACKET.rawValue)
		 	setState(181)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == ProgryParser.Tokens.ELSE.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(174)
		 		try match(ProgryParser.Tokens.ELSE.rawValue)
		 		setState(175)
		 		try match(ProgryParser.Tokens.OPEN_BRACKET.rawValue)
		 		setState(176)
		 		try statute()
		 		setState(177)
		 		try match(ProgryParser.Tokens.CLOSE_BRACKET.rawValue)


		 		setState(183)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class WhileContext: ParserRuleContext {
			open
			func WHILE() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.WHILE.rawValue, 0)
			}
			open
			func OPEN_PARENTHESIS() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.OPEN_PARENTHESIS.rawValue, 0)
			}
			open
			func g_expr() -> G_exprContext? {
				return getRuleContext(G_exprContext.self, 0)
			}
			open
			func CLOSE_PARENTHESIS() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.CLOSE_PARENTHESIS.rawValue, 0)
			}
			open
			func DO() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.DO.rawValue, 0)
			}
			open
			func OPEN_BRACKET() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.OPEN_BRACKET.rawValue, 0)
			}
			open
			func CLOSE_BRACKET() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.CLOSE_BRACKET.rawValue, 0)
			}
			open
			func statute() -> [StatuteContext] {
				return getRuleContexts(StatuteContext.self)
			}
			open
			func statute(_ i: Int) -> StatuteContext? {
				return getRuleContext(StatuteContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ProgryParser.RULE_while
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.enterWhile(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.exitWhile(self)
			}
		}
	}
	@discardableResult
	 open func `while`() throws -> WhileContext {
		var _localctx: WhileContext
		_localctx = WhileContext(_ctx, getState())
		try enterRule(_localctx, 26, ProgryParser.RULE_while)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(184)
		 	try match(ProgryParser.Tokens.WHILE.rawValue)
		 	setState(185)
		 	try match(ProgryParser.Tokens.OPEN_PARENTHESIS.rawValue)
		 	setState(186)
		 	try g_expr()
		 	setState(187)
		 	try match(ProgryParser.Tokens.CLOSE_PARENTHESIS.rawValue)
		 	setState(188)
		 	try match(ProgryParser.Tokens.DO.rawValue)
		 	setState(189)
		 	try match(ProgryParser.Tokens.OPEN_BRACKET.rawValue)
		 	setState(193)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, ProgryParser.Tokens.OPEN_PARENTHESIS.rawValue,ProgryParser.Tokens.ARRAY.rawValue,ProgryParser.Tokens.VAR.rawValue,ProgryParser.Tokens.READ.rawValue,ProgryParser.Tokens.WRITE.rawValue,ProgryParser.Tokens.IF.rawValue,ProgryParser.Tokens.FOR.rawValue,ProgryParser.Tokens.WHILE.rawValue,ProgryParser.Tokens.ID.rawValue,ProgryParser.Tokens.NUMBER.rawValue,ProgryParser.Tokens.DECIMAL.rawValue,ProgryParser.Tokens.TEXT.rawValue,ProgryParser.Tokens.FLAG.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(190)
		 		try statute()


		 		setState(195)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(196)
		 	try match(ProgryParser.Tokens.CLOSE_BRACKET.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ForContext: ParserRuleContext {
			open
			func FOR() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.FOR.rawValue, 0)
			}
			open
			func VAR() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.VAR.rawValue, 0)
			}
			open
			func ID() -> [TerminalNode] {
				return getTokens(ProgryParser.Tokens.ID.rawValue)
			}
			open
			func ID(_ i:Int) -> TerminalNode? {
				return getToken(ProgryParser.Tokens.ID.rawValue, i)
			}
			open
			func EQUAL() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.EQUAL.rawValue, 0)
			}
			open
			func TO() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.TO.rawValue, 0)
			}
			open
			func OPEN_BRACKET() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.OPEN_BRACKET.rawValue, 0)
			}
			open
			func CLOSE_BRACKET() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.CLOSE_BRACKET.rawValue, 0)
			}
			open
			func cte() -> [CteContext] {
				return getRuleContexts(CteContext.self)
			}
			open
			func cte(_ i: Int) -> CteContext? {
				return getRuleContext(CteContext.self, i)
			}
			open
			func statute() -> [StatuteContext] {
				return getRuleContexts(StatuteContext.self)
			}
			open
			func statute(_ i: Int) -> StatuteContext? {
				return getRuleContext(StatuteContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ProgryParser.RULE_for
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.enterFor(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.exitFor(self)
			}
		}
	}
	@discardableResult
	 open func `for`() throws -> ForContext {
		var _localctx: ForContext
		_localctx = ForContext(_ctx, getState())
		try enterRule(_localctx, 28, ProgryParser.RULE_for)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(198)
		 	try match(ProgryParser.Tokens.FOR.rawValue)
		 	setState(199)
		 	try match(ProgryParser.Tokens.VAR.rawValue)
		 	setState(200)
		 	try match(ProgryParser.Tokens.ID.rawValue)
		 	setState(201)
		 	try match(ProgryParser.Tokens.EQUAL.rawValue)
		 	setState(204)
		 	try _errHandler.sync(self)
		 	switch (ProgryParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .NUMBER:fallthrough
		 	case .DECIMAL:fallthrough
		 	case .TEXT:fallthrough
		 	case .FLAG:
		 		setState(202)
		 		try cte()

		 		break

		 	case .ID:
		 		setState(203)
		 		try match(ProgryParser.Tokens.ID.rawValue)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		 	setState(206)
		 	try match(ProgryParser.Tokens.TO.rawValue)
		 	setState(209)
		 	try _errHandler.sync(self)
		 	switch (ProgryParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .NUMBER:fallthrough
		 	case .DECIMAL:fallthrough
		 	case .TEXT:fallthrough
		 	case .FLAG:
		 		setState(207)
		 		try cte()

		 		break

		 	case .ID:
		 		setState(208)
		 		try match(ProgryParser.Tokens.ID.rawValue)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		 	setState(211)
		 	try match(ProgryParser.Tokens.OPEN_BRACKET.rawValue)
		 	setState(215)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, ProgryParser.Tokens.OPEN_PARENTHESIS.rawValue,ProgryParser.Tokens.ARRAY.rawValue,ProgryParser.Tokens.VAR.rawValue,ProgryParser.Tokens.READ.rawValue,ProgryParser.Tokens.WRITE.rawValue,ProgryParser.Tokens.IF.rawValue,ProgryParser.Tokens.FOR.rawValue,ProgryParser.Tokens.WHILE.rawValue,ProgryParser.Tokens.ID.rawValue,ProgryParser.Tokens.NUMBER.rawValue,ProgryParser.Tokens.DECIMAL.rawValue,ProgryParser.Tokens.TEXT.rawValue,ProgryParser.Tokens.FLAG.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(212)
		 		try statute()


		 		setState(217)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(218)
		 	try match(ProgryParser.Tokens.CLOSE_BRACKET.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class T_exprContext: ParserRuleContext {
			open
			func g_expr() -> [G_exprContext] {
				return getRuleContexts(G_exprContext.self)
			}
			open
			func g_expr(_ i: Int) -> G_exprContext? {
				return getRuleContext(G_exprContext.self, i)
			}
			open
			func AND() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.AND.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ProgryParser.RULE_t_expr
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.enterT_expr(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.exitT_expr(self)
			}
		}
	}
	@discardableResult
	 open func t_expr() throws -> T_exprContext {
		var _localctx: T_exprContext
		_localctx = T_exprContext(_ctx, getState())
		try enterRule(_localctx, 30, ProgryParser.RULE_t_expr)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(225)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,20, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(220)
		 		try g_expr()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(221)
		 		try g_expr()
		 		setState(222)
		 		try match(ProgryParser.Tokens.AND.rawValue)
		 		setState(223)
		 		try g_expr()

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class G_exprContext: ParserRuleContext {
			open
			func m_expr() -> [M_exprContext] {
				return getRuleContexts(M_exprContext.self)
			}
			open
			func m_expr(_ i: Int) -> M_exprContext? {
				return getRuleContext(M_exprContext.self, i)
			}
			open
			func DIFERENT_THAN() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.DIFERENT_THAN.rawValue, 0)
			}
			open
			func MORE_THAN() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.MORE_THAN.rawValue, 0)
			}
			open
			func EQUAL_THAN() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.EQUAL_THAN.rawValue, 0)
			}
			open
			func LESS_THEN() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.LESS_THEN.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ProgryParser.RULE_g_expr
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.enterG_expr(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.exitG_expr(self)
			}
		}
	}
	@discardableResult
	 open func g_expr() throws -> G_exprContext {
		var _localctx: G_exprContext
		_localctx = G_exprContext(_ctx, getState())
		try enterRule(_localctx, 32, ProgryParser.RULE_g_expr)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(232)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,21, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(227)
		 		try m_expr()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(228)
		 		try m_expr()
		 		setState(229)
		 		_la = try _input.LA(1)
		 		if (!(//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, ProgryParser.Tokens.MORE_THAN.rawValue,ProgryParser.Tokens.LESS_THEN.rawValue,ProgryParser.Tokens.EQUAL_THAN.rawValue,ProgryParser.Tokens.DIFERENT_THAN.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 0)
		 		}()
		 		      return testSet
		 		 }())) {
		 		try _errHandler.recoverInline(self)
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(230)
		 		try m_expr()

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class M_exprContext: ParserRuleContext {
			open
			func t() -> [TContext] {
				return getRuleContexts(TContext.self)
			}
			open
			func t(_ i: Int) -> TContext? {
				return getRuleContext(TContext.self, i)
			}
			open
			func PLUS() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.PLUS.rawValue, 0)
			}
			open
			func MINUS() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.MINUS.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ProgryParser.RULE_m_expr
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.enterM_expr(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.exitM_expr(self)
			}
		}
	}
	@discardableResult
	 open func m_expr() throws -> M_exprContext {
		var _localctx: M_exprContext
		_localctx = M_exprContext(_ctx, getState())
		try enterRule(_localctx, 34, ProgryParser.RULE_m_expr)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(239)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,22, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(234)
		 		try t()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(235)
		 		try t()
		 		setState(236)
		 		_la = try _input.LA(1)
		 		if (!(//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == ProgryParser.Tokens.PLUS.rawValue || _la == ProgryParser.Tokens.MINUS.rawValue
		 		      return testSet
		 		 }())) {
		 		try _errHandler.recoverInline(self)
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(237)
		 		try t()

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TContext: ParserRuleContext {
			open
			func f() -> [FContext] {
				return getRuleContexts(FContext.self)
			}
			open
			func f(_ i: Int) -> FContext? {
				return getRuleContext(FContext.self, i)
			}
			open
			func DIV() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.DIV.rawValue, 0)
			}
			open
			func MULT() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.MULT.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ProgryParser.RULE_t
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.enterT(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.exitT(self)
			}
		}
	}
	@discardableResult
	 open func t() throws -> TContext {
		var _localctx: TContext
		_localctx = TContext(_ctx, getState())
		try enterRule(_localctx, 36, ProgryParser.RULE_t)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(246)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,23, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(241)
		 		try f()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(242)
		 		try f()
		 		setState(243)
		 		_la = try _input.LA(1)
		 		if (!(//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == ProgryParser.Tokens.MULT.rawValue || _la == ProgryParser.Tokens.DIV.rawValue
		 		      return testSet
		 		 }())) {
		 		try _errHandler.recoverInline(self)
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(244)
		 		try f()

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FContext: ParserRuleContext {
			open
			func ID() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.ID.rawValue, 0)
			}
			open
			func OPEN_SBRACKET() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.OPEN_SBRACKET.rawValue, 0)
			}
			open
			func m_expr() -> M_exprContext? {
				return getRuleContext(M_exprContext.self, 0)
			}
			open
			func CLOSE_SBRACKET() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.CLOSE_SBRACKET.rawValue, 0)
			}
			open
			func cte() -> CteContext? {
				return getRuleContext(CteContext.self, 0)
			}
			open
			func OPEN_PARENTHESIS() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.OPEN_PARENTHESIS.rawValue, 0)
			}
			open
			func CLOSE_PARENTHESIS() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.CLOSE_PARENTHESIS.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ProgryParser.RULE_f
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.enterF(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.exitF(self)
			}
		}
	}
	@discardableResult
	 open func f() throws -> FContext {
		var _localctx: FContext
		_localctx = FContext(_ctx, getState())
		try enterRule(_localctx, 38, ProgryParser.RULE_f)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(259)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,24, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(248)
		 		try match(ProgryParser.Tokens.ID.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(249)
		 		try match(ProgryParser.Tokens.ID.rawValue)
		 		setState(250)
		 		try match(ProgryParser.Tokens.OPEN_SBRACKET.rawValue)
		 		setState(251)
		 		try m_expr()
		 		setState(252)
		 		try match(ProgryParser.Tokens.CLOSE_SBRACKET.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(254)
		 		try cte()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(255)
		 		try match(ProgryParser.Tokens.OPEN_PARENTHESIS.rawValue)
		 		setState(256)
		 		try m_expr()
		 		setState(257)
		 		try match(ProgryParser.Tokens.CLOSE_PARENTHESIS.rawValue)

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	static let _serializedATN:[Int] = [
		4,1,45,262,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,2,7,
		7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,2,14,7,14,
		2,15,7,15,2,16,7,16,2,17,7,17,2,18,7,18,2,19,7,19,1,0,1,0,1,0,4,0,44,8,
		0,11,0,12,0,45,3,0,48,8,0,1,0,4,0,51,8,0,11,0,12,0,52,3,0,55,8,0,1,0,1,
		0,1,0,1,0,1,0,1,1,1,1,1,1,4,1,65,8,1,11,1,12,1,66,1,1,1,1,1,2,1,2,1,2,
		1,2,5,2,75,8,2,10,2,12,2,78,9,2,1,2,1,2,1,3,1,3,1,4,1,4,1,5,1,5,1,5,1,
		5,1,5,1,5,1,5,1,5,1,5,3,5,95,8,5,1,6,1,6,1,6,1,6,1,6,1,7,1,7,1,7,1,7,1,
		8,1,8,1,8,1,8,1,8,3,8,111,8,8,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,
		3,9,123,8,9,1,9,1,9,1,10,1,10,1,10,1,10,1,10,3,10,132,8,10,1,10,1,10,1,
		10,1,10,4,10,138,8,10,11,10,12,10,139,5,10,142,8,10,10,10,12,10,145,9,
		10,1,10,1,10,1,10,1,11,1,11,1,11,1,11,1,11,1,11,5,11,156,8,11,10,11,12,
		11,159,9,11,1,11,1,11,1,12,1,12,1,12,1,12,1,12,1,12,5,12,169,8,12,10,12,
		12,12,172,9,12,1,12,1,12,1,12,1,12,1,12,1,12,5,12,180,8,12,10,12,12,12,
		183,9,12,1,13,1,13,1,13,1,13,1,13,1,13,1,13,5,13,192,8,13,10,13,12,13,
		195,9,13,1,13,1,13,1,14,1,14,1,14,1,14,1,14,1,14,3,14,205,8,14,1,14,1,
		14,1,14,3,14,210,8,14,1,14,1,14,5,14,214,8,14,10,14,12,14,217,9,14,1,14,
		1,14,1,15,1,15,1,15,1,15,1,15,3,15,226,8,15,1,16,1,16,1,16,1,16,1,16,3,
		16,233,8,16,1,17,1,17,1,17,1,17,1,17,3,17,240,8,17,1,18,1,18,1,18,1,18,
		1,18,3,18,247,8,18,1,19,1,19,1,19,1,19,1,19,1,19,1,19,1,19,1,19,1,19,1,
		19,3,19,260,8,19,1,19,0,0,20,0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,
		32,34,36,38,0,5,1,0,28,31,1,0,41,44,2,0,8,9,12,13,1,0,1,2,1,0,3,4,277,
		0,40,1,0,0,0,2,61,1,0,0,0,4,70,1,0,0,0,6,81,1,0,0,0,8,83,1,0,0,0,10,94,
		1,0,0,0,12,96,1,0,0,0,14,101,1,0,0,0,16,110,1,0,0,0,18,122,1,0,0,0,20,
		126,1,0,0,0,22,149,1,0,0,0,24,162,1,0,0,0,26,184,1,0,0,0,28,198,1,0,0,
		0,30,225,1,0,0,0,32,232,1,0,0,0,34,239,1,0,0,0,36,246,1,0,0,0,38,259,1,
		0,0,0,40,41,5,23,0,0,41,47,5,25,0,0,42,44,3,18,9,0,43,42,1,0,0,0,44,45,
		1,0,0,0,45,43,1,0,0,0,45,46,1,0,0,0,46,48,1,0,0,0,47,43,1,0,0,0,47,48,
		1,0,0,0,48,54,1,0,0,0,49,51,3,4,2,0,50,49,1,0,0,0,51,52,1,0,0,0,52,50,
		1,0,0,0,52,53,1,0,0,0,53,55,1,0,0,0,54,50,1,0,0,0,54,55,1,0,0,0,55,56,
		1,0,0,0,56,57,3,2,1,0,57,58,5,24,0,0,58,59,5,25,0,0,59,60,5,0,0,1,60,1,
		1,0,0,0,61,62,5,21,0,0,62,64,5,16,0,0,63,65,3,10,5,0,64,63,1,0,0,0,65,
		66,1,0,0,0,66,64,1,0,0,0,66,67,1,0,0,0,67,68,1,0,0,0,68,69,5,17,0,0,69,
		3,1,0,0,0,70,71,5,20,0,0,71,72,5,40,0,0,72,76,5,16,0,0,73,75,3,10,5,0,
		74,73,1,0,0,0,75,78,1,0,0,0,76,74,1,0,0,0,76,77,1,0,0,0,77,79,1,0,0,0,
		78,76,1,0,0,0,79,80,5,17,0,0,80,5,1,0,0,0,81,82,7,0,0,0,82,7,1,0,0,0,83,
		84,7,1,0,0,84,9,1,0,0,0,85,95,3,12,6,0,86,95,3,14,7,0,87,95,3,16,8,0,88,
		95,3,18,9,0,89,95,3,20,10,0,90,95,3,22,11,0,91,95,3,24,12,0,92,95,3,26,
		13,0,93,95,3,28,14,0,94,85,1,0,0,0,94,86,1,0,0,0,94,87,1,0,0,0,94,88,1,
		0,0,0,94,89,1,0,0,0,94,90,1,0,0,0,94,91,1,0,0,0,94,92,1,0,0,0,94,93,1,
		0,0,0,95,11,1,0,0,0,96,97,5,40,0,0,97,98,5,5,0,0,98,99,3,34,17,0,99,100,
		5,25,0,0,100,13,1,0,0,0,101,102,5,32,0,0,102,103,5,40,0,0,103,104,5,25,
		0,0,104,15,1,0,0,0,105,111,3,30,15,0,106,107,3,30,15,0,107,108,5,6,0,0,
		108,109,3,30,15,0,109,111,1,0,0,0,110,105,1,0,0,0,110,106,1,0,0,0,111,
		17,1,0,0,0,112,113,5,27,0,0,113,114,3,6,3,0,114,115,5,40,0,0,115,123,1,
		0,0,0,116,117,5,27,0,0,117,118,3,6,3,0,118,119,5,40,0,0,119,120,5,26,0,
		0,120,121,3,18,9,0,121,123,1,0,0,0,122,112,1,0,0,0,122,116,1,0,0,0,123,
		124,1,0,0,0,124,125,5,25,0,0,125,19,1,0,0,0,126,127,5,33,0,0,127,131,5,
		14,0,0,128,132,3,34,17,0,129,132,3,8,4,0,130,132,5,40,0,0,131,128,1,0,
		0,0,131,129,1,0,0,0,131,130,1,0,0,0,132,143,1,0,0,0,133,137,5,26,0,0,134,
		138,3,34,17,0,135,138,3,8,4,0,136,138,5,40,0,0,137,134,1,0,0,0,137,135,
		1,0,0,0,137,136,1,0,0,0,138,139,1,0,0,0,139,137,1,0,0,0,139,140,1,0,0,
		0,140,142,1,0,0,0,141,133,1,0,0,0,142,145,1,0,0,0,143,141,1,0,0,0,143,
		144,1,0,0,0,144,146,1,0,0,0,145,143,1,0,0,0,146,147,5,15,0,0,147,148,5,
		25,0,0,148,21,1,0,0,0,149,150,5,22,0,0,150,151,3,6,3,0,151,152,5,14,0,
		0,152,153,3,8,4,0,153,157,5,26,0,0,154,156,3,8,4,0,155,154,1,0,0,0,156,
		159,1,0,0,0,157,155,1,0,0,0,157,158,1,0,0,0,158,160,1,0,0,0,159,157,1,
		0,0,0,160,161,5,15,0,0,161,23,1,0,0,0,162,163,5,34,0,0,163,164,5,14,0,
		0,164,165,3,16,8,0,165,166,5,15,0,0,166,170,5,16,0,0,167,169,3,10,5,0,
		168,167,1,0,0,0,169,172,1,0,0,0,170,168,1,0,0,0,170,171,1,0,0,0,171,173,
		1,0,0,0,172,170,1,0,0,0,173,181,5,17,0,0,174,175,5,35,0,0,175,176,5,16,
		0,0,176,177,3,10,5,0,177,178,5,17,0,0,178,180,1,0,0,0,179,174,1,0,0,0,
		180,183,1,0,0,0,181,179,1,0,0,0,181,182,1,0,0,0,182,25,1,0,0,0,183,181,
		1,0,0,0,184,185,5,37,0,0,185,186,5,14,0,0,186,187,3,32,16,0,187,188,5,
		15,0,0,188,189,5,38,0,0,189,193,5,16,0,0,190,192,3,10,5,0,191,190,1,0,
		0,0,192,195,1,0,0,0,193,191,1,0,0,0,193,194,1,0,0,0,194,196,1,0,0,0,195,
		193,1,0,0,0,196,197,5,17,0,0,197,27,1,0,0,0,198,199,5,36,0,0,199,200,5,
		27,0,0,200,201,5,40,0,0,201,204,5,5,0,0,202,205,3,8,4,0,203,205,5,40,0,
		0,204,202,1,0,0,0,204,203,1,0,0,0,205,206,1,0,0,0,206,209,5,39,0,0,207,
		210,3,8,4,0,208,210,5,40,0,0,209,207,1,0,0,0,209,208,1,0,0,0,210,211,1,
		0,0,0,211,215,5,16,0,0,212,214,3,10,5,0,213,212,1,0,0,0,214,217,1,0,0,
		0,215,213,1,0,0,0,215,216,1,0,0,0,216,218,1,0,0,0,217,215,1,0,0,0,218,
		219,5,17,0,0,219,29,1,0,0,0,220,226,3,32,16,0,221,222,3,32,16,0,222,223,
		5,7,0,0,223,224,3,32,16,0,224,226,1,0,0,0,225,220,1,0,0,0,225,221,1,0,
		0,0,226,31,1,0,0,0,227,233,3,34,17,0,228,229,3,34,17,0,229,230,7,2,0,0,
		230,231,3,34,17,0,231,233,1,0,0,0,232,227,1,0,0,0,232,228,1,0,0,0,233,
		33,1,0,0,0,234,240,3,36,18,0,235,236,3,36,18,0,236,237,7,3,0,0,237,238,
		3,36,18,0,238,240,1,0,0,0,239,234,1,0,0,0,239,235,1,0,0,0,240,35,1,0,0,
		0,241,247,3,38,19,0,242,243,3,38,19,0,243,244,7,4,0,0,244,245,3,38,19,
		0,245,247,1,0,0,0,246,241,1,0,0,0,246,242,1,0,0,0,247,37,1,0,0,0,248,260,
		5,40,0,0,249,250,5,40,0,0,250,251,5,18,0,0,251,252,3,34,17,0,252,253,5,
		19,0,0,253,260,1,0,0,0,254,260,3,8,4,0,255,256,5,14,0,0,256,257,3,34,17,
		0,257,258,5,15,0,0,258,260,1,0,0,0,259,248,1,0,0,0,259,249,1,0,0,0,259,
		254,1,0,0,0,259,255,1,0,0,0,260,39,1,0,0,0,25,45,47,52,54,66,76,94,110,
		122,131,137,139,143,157,170,181,193,204,209,215,225,232,239,246,259
	]

	public
	static let _ATN = try! ATNDeserializer().deserialize(_serializedATN)
}