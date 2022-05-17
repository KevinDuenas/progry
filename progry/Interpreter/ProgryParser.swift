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
                 PROGRAM_END = 24, COLON = 25, DOT_COMMA = 26, COMMA = 27, 
                 VAR = 28, NUMBER_TYPE = 29, DECIMAL_TYPE = 30, TEXT_TYPE = 31, 
                 FLAG_TYPE = 32, READ = 33, WRITE = 34, IF = 35, ELSE = 36, 
                 FOR = 37, WHILE = 38, DO = 39, TO = 40, RETURN = 41, VOID = 42, 
                 ID = 43, TEXT = 44, LETTER = 45, DIGIT = 46, DECIMAL = 47, 
                 COM = 48, FLAG = 49, WS = 50
	}

	public
	static let RULE_program = 0, RULE_main = 1, RULE_module = 2, RULE_type = 3, 
            RULE_cte = 4, RULE_statute = 5, RULE_asignation = 6, RULE_read = 7, 
            RULE_expr = 8, RULE_vars = 9, RULE_write = 10, RULE_arrays = 11, 
            RULE_ifs = 12, RULE_whiles = 13, RULE_fors = 14, RULE_g_expr = 15, 
            RULE_m_expr = 16, RULE_t = 17, RULE_f = 18

	public
	static let ruleNames: [String] = [
		"program", "main", "module", "type", "cte", "statute", "asignation", "read", 
		"expr", "vars", "write", "arrays", "ifs", "whiles", "fors", "g_expr", 
		"m_expr", "t", "f"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, "'+'", "'-'", "'*'", "'/'", "'='", "'||'", "'&&'", "'>'", "'<'", 
		"'>='", "'<='", "'=='", "'!='", "'('", "')'", "'{'", "'}'", "'['", "']'", 
		"'module'", "'main'", "'array'", "'PROGRAM_START'", "'PROGRAM_END'", "':'", 
		"';'", "','", "'var'", "'number'", "'decimal'", "'text'", "'flag'", "'read'", 
		"'write'", "'if'", "'else'", "'for'", "'while'", "'do'", "'to'", "'return'", 
		"'void'", nil, nil, nil, nil, nil, "'\"'"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, "PLUS", "MINUS", "MULT", "DIV", "EQUAL", "OR", "AND", "MORE_THAN", 
		"LESS_THEN", "MORE_AND_THAN", "LESS_AND_THAN", "EQUAL_THAN", "DIFERENT_THAN", 
		"OPEN_PARENTHESIS", "CLOSE_PARENTHESIS", "OPEN_BRACKET", "CLOSE_BRACKET", 
		"OPEN_SBRACKET", "CLOSE_SBRACKET", "MODULE", "MAIN", "ARRAY", "PROGRAM_START", 
		"PROGRAM_END", "COLON", "DOT_COMMA", "COMMA", "VAR", "NUMBER_TYPE", "DECIMAL_TYPE", 
		"TEXT_TYPE", "FLAG_TYPE", "READ", "WRITE", "IF", "ELSE", "FOR", "WHILE", 
		"DO", "TO", "RETURN", "VOID", "ID", "TEXT", "LETTER", "DIGIT", "DECIMAL", 
		"COM", "FLAG", "WS"
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
			func vars() -> VarsContext? {
				return getRuleContext(VarsContext.self, 0)
			}
			open
			func module() -> ModuleContext? {
				return getRuleContext(ModuleContext.self, 0)
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
		 	setState(38)
		 	try match(ProgryParser.Tokens.PROGRAM_START.rawValue)
		 	setState(39)
		 	try match(ProgryParser.Tokens.DOT_COMMA.rawValue)
		 	setState(41)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == ProgryParser.Tokens.VAR.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(40)
		 		try vars()

		 	}

		 	setState(44)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == ProgryParser.Tokens.MODULE.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(43)
		 		try module()

		 	}

		 	setState(46)
		 	try main()
		 	setState(47)
		 	try match(ProgryParser.Tokens.PROGRAM_END.rawValue)
		 	setState(48)
		 	try match(ProgryParser.Tokens.DOT_COMMA.rawValue)
		 	setState(49)
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
			func vars() -> VarsContext? {
				return getRuleContext(VarsContext.self, 0)
			}
			open
			func statute() -> StatuteContext? {
				return getRuleContext(StatuteContext.self, 0)
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
		 	setState(51)
		 	try match(ProgryParser.Tokens.MAIN.rawValue)
		 	setState(52)
		 	try match(ProgryParser.Tokens.OPEN_BRACKET.rawValue)
		 	setState(54)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == ProgryParser.Tokens.VAR.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(53)
		 		try vars()

		 	}

		 	setState(57)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, ProgryParser.Tokens.OPEN_PARENTHESIS.rawValue,ProgryParser.Tokens.ARRAY.rawValue,ProgryParser.Tokens.READ.rawValue,ProgryParser.Tokens.WRITE.rawValue,ProgryParser.Tokens.IF.rawValue,ProgryParser.Tokens.FOR.rawValue,ProgryParser.Tokens.WHILE.rawValue,ProgryParser.Tokens.ID.rawValue,ProgryParser.Tokens.TEXT.rawValue,ProgryParser.Tokens.DIGIT.rawValue,ProgryParser.Tokens.DECIMAL.rawValue,ProgryParser.Tokens.FLAG.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(56)
		 		try statute()

		 	}

		 	setState(59)
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
			func COLON() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.COLON.rawValue, 0)
			}
			open
			func OPEN_BRACKET() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.OPEN_BRACKET.rawValue, 0)
			}
			open
			func RETURN() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.RETURN.rawValue, 0)
			}
			open
			func CLOSE_BRACKET() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.CLOSE_BRACKET.rawValue, 0)
			}
			open
			func type() -> TypeContext? {
				return getRuleContext(TypeContext.self, 0)
			}
			open
			func VOID() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.VOID.rawValue, 0)
			}
			open
			func vars() -> VarsContext? {
				return getRuleContext(VarsContext.self, 0)
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
		 	setState(61)
		 	try match(ProgryParser.Tokens.MODULE.rawValue)
		 	setState(62)
		 	try match(ProgryParser.Tokens.ID.rawValue)
		 	setState(63)
		 	try match(ProgryParser.Tokens.COLON.rawValue)
		 	setState(66)
		 	try _errHandler.sync(self)
		 	switch (ProgryParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .NUMBER_TYPE:fallthrough
		 	case .DECIMAL_TYPE:fallthrough
		 	case .TEXT_TYPE:fallthrough
		 	case .FLAG_TYPE:
		 		setState(64)
		 		try type()

		 		break

		 	case .VOID:
		 		setState(65)
		 		try match(ProgryParser.Tokens.VOID.rawValue)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		 	setState(68)
		 	try match(ProgryParser.Tokens.OPEN_BRACKET.rawValue)
		 	setState(70)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == ProgryParser.Tokens.VAR.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(69)
		 		try vars()

		 	}

		 	setState(77)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, ProgryParser.Tokens.OPEN_PARENTHESIS.rawValue,ProgryParser.Tokens.ARRAY.rawValue,ProgryParser.Tokens.READ.rawValue,ProgryParser.Tokens.WRITE.rawValue,ProgryParser.Tokens.IF.rawValue,ProgryParser.Tokens.FOR.rawValue,ProgryParser.Tokens.WHILE.rawValue,ProgryParser.Tokens.ID.rawValue,ProgryParser.Tokens.TEXT.rawValue,ProgryParser.Tokens.DIGIT.rawValue,ProgryParser.Tokens.DECIMAL.rawValue,ProgryParser.Tokens.FLAG.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(73) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(72)
		 			try statute()


		 			setState(75); 
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		} while (//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, ProgryParser.Tokens.OPEN_PARENTHESIS.rawValue,ProgryParser.Tokens.ARRAY.rawValue,ProgryParser.Tokens.READ.rawValue,ProgryParser.Tokens.WRITE.rawValue,ProgryParser.Tokens.IF.rawValue,ProgryParser.Tokens.FOR.rawValue,ProgryParser.Tokens.WHILE.rawValue,ProgryParser.Tokens.ID.rawValue,ProgryParser.Tokens.TEXT.rawValue,ProgryParser.Tokens.DIGIT.rawValue,ProgryParser.Tokens.DECIMAL.rawValue,ProgryParser.Tokens.FLAG.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 0)
		 		}()
		 		      return testSet
		 		 }())

		 	}

		 	setState(79)
		 	try match(ProgryParser.Tokens.RETURN.rawValue)
		 	setState(80)
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
		 	setState(82)
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
			open
			func DIGIT() -> [TerminalNode] {
				return getTokens(ProgryParser.Tokens.DIGIT.rawValue)
			}
			open
			func DIGIT(_ i:Int) -> TerminalNode? {
				return getToken(ProgryParser.Tokens.DIGIT.rawValue, i)
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
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(92)
		 	try _errHandler.sync(self)
		 	switch (ProgryParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .DIGIT:
		 		setState(85); 
		 		try _errHandler.sync(self)
		 		_alt = 1;
		 		repeat {
		 			switch (_alt) {
		 			case 1:
		 				setState(84)
		 				try match(ProgryParser.Tokens.DIGIT.rawValue)


		 				break
		 			default:
		 				throw ANTLRException.recognition(e: NoViableAltException(self))
		 			}
		 			setState(87); 
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,8,_ctx)
		 		} while (_alt != 2 && _alt !=  ATN.INVALID_ALT_NUMBER)

		 		break

		 	case .DECIMAL:
		 		setState(89)
		 		try match(ProgryParser.Tokens.DECIMAL.rawValue)

		 		break

		 	case .TEXT:
		 		setState(90)
		 		try match(ProgryParser.Tokens.TEXT.rawValue)

		 		break

		 	case .FLAG:
		 		setState(91)
		 		try match(ProgryParser.Tokens.FLAG.rawValue)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
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
			func write() -> WriteContext? {
				return getRuleContext(WriteContext.self, 0)
			}
			open
			func arrays() -> ArraysContext? {
				return getRuleContext(ArraysContext.self, 0)
			}
			open
			func ifs() -> IfsContext? {
				return getRuleContext(IfsContext.self, 0)
			}
			open
			func whiles() -> WhilesContext? {
				return getRuleContext(WhilesContext.self, 0)
			}
			open
			func fors() -> ForsContext? {
				return getRuleContext(ForsContext.self, 0)
			}
			open
			func expr() -> ExprContext? {
				return getRuleContext(ExprContext.self, 0)
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
		 	setState(102)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,10, _ctx)) {
		 	case 1:
		 		setState(94)
		 		try asignation()

		 		break
		 	case 2:
		 		setState(95)
		 		try read()

		 		break
		 	case 3:
		 		setState(96)
		 		try write()

		 		break
		 	case 4:
		 		setState(97)
		 		try arrays()

		 		break
		 	case 5:
		 		setState(98)
		 		try ifs()

		 		break
		 	case 6:
		 		setState(99)
		 		try whiles()

		 		break
		 	case 7:
		 		setState(100)
		 		try fors()

		 		break
		 	case 8:
		 		setState(101)
		 		try expr()

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
		 	setState(104)
		 	try match(ProgryParser.Tokens.ID.rawValue)
		 	setState(105)
		 	try match(ProgryParser.Tokens.EQUAL.rawValue)
		 	setState(106)
		 	try m_expr()
		 	setState(107)
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
		 	setState(109)
		 	try match(ProgryParser.Tokens.READ.rawValue)
		 	setState(110)
		 	try match(ProgryParser.Tokens.ID.rawValue)
		 	setState(111)
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
			func g_expr() -> G_exprContext? {
				return getRuleContext(G_exprContext.self, 0)
			}
			open
			func expr() -> ExprContext? {
				return getRuleContext(ExprContext.self, 0)
			}
			open
			func OR() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.OR.rawValue, 0)
			}
			open
			func AND() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.AND.rawValue, 0)
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
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(118)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,11, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(113)
		 		try g_expr()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(114)
		 		try g_expr()
		 		setState(115)
		 		_la = try _input.LA(1)
		 		if (!(//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == ProgryParser.Tokens.OR.rawValue || _la == ProgryParser.Tokens.AND.rawValue
		 		      return testSet
		 		 }())) {
		 		try _errHandler.recoverInline(self)
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(116)
		 		try expr()

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
			func DOT_COMMA() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.DOT_COMMA.rawValue, 0)
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
		 	setState(120)
		 	try match(ProgryParser.Tokens.VAR.rawValue)
		 	setState(121)
		 	try type()
		 	setState(122)
		 	try match(ProgryParser.Tokens.ID.rawValue)
		 	setState(123)
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
		 	setState(125)
		 	try match(ProgryParser.Tokens.WRITE.rawValue)
		 	setState(126)
		 	try match(ProgryParser.Tokens.OPEN_PARENTHESIS.rawValue)
		 	setState(130)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,12, _ctx)) {
		 	case 1:
		 		setState(127)
		 		try m_expr()

		 		break
		 	case 2:
		 		setState(128)
		 		try cte()

		 		break
		 	case 3:
		 		setState(129)
		 		try match(ProgryParser.Tokens.ID.rawValue)

		 		break
		 	default: break
		 	}
		 	setState(142)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == ProgryParser.Tokens.COMMA.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(132)
		 		try match(ProgryParser.Tokens.COMMA.rawValue)
		 		setState(136) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(136)
		 			try _errHandler.sync(self)
		 			switch(try getInterpreter().adaptivePredict(_input,13, _ctx)) {
		 			case 1:
		 				setState(133)
		 				try m_expr()

		 				break
		 			case 2:
		 				setState(134)
		 				try cte()

		 				break
		 			case 3:
		 				setState(135)
		 				try match(ProgryParser.Tokens.ID.rawValue)

		 				break
		 			default: break
		 			}

		 			setState(138); 
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		} while (//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, ProgryParser.Tokens.OPEN_PARENTHESIS.rawValue,ProgryParser.Tokens.ID.rawValue,ProgryParser.Tokens.TEXT.rawValue,ProgryParser.Tokens.DIGIT.rawValue,ProgryParser.Tokens.DECIMAL.rawValue,ProgryParser.Tokens.FLAG.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 0)
		 		}()
		 		      return testSet
		 		 }())


		 		setState(144)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(145)
		 	try match(ProgryParser.Tokens.CLOSE_PARENTHESIS.rawValue)
		 	setState(146)
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
		 	setState(148)
		 	try match(ProgryParser.Tokens.ARRAY.rawValue)
		 	setState(149)
		 	try type()
		 	setState(150)
		 	try match(ProgryParser.Tokens.OPEN_PARENTHESIS.rawValue)
		 	setState(151)
		 	try cte()

		 	setState(152)
		 	try match(ProgryParser.Tokens.COMMA.rawValue)
		 	setState(156)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, ProgryParser.Tokens.TEXT.rawValue,ProgryParser.Tokens.DIGIT.rawValue,ProgryParser.Tokens.DECIMAL.rawValue,ProgryParser.Tokens.FLAG.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(153)
		 		try cte()


		 		setState(158)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}

		 	setState(159)
		 	try match(ProgryParser.Tokens.CLOSE_PARENTHESIS.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class IfsContext: ParserRuleContext {
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
			return ProgryParser.RULE_ifs
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.enterIfs(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.exitIfs(self)
			}
		}
	}
	@discardableResult
	 open func ifs() throws -> IfsContext {
		var _localctx: IfsContext
		_localctx = IfsContext(_ctx, getState())
		try enterRule(_localctx, 24, ProgryParser.RULE_ifs)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(161)
		 	try match(ProgryParser.Tokens.IF.rawValue)
		 	setState(162)
		 	try match(ProgryParser.Tokens.OPEN_PARENTHESIS.rawValue)
		 	setState(163)
		 	try expr()
		 	setState(164)
		 	try match(ProgryParser.Tokens.CLOSE_PARENTHESIS.rawValue)
		 	setState(165)
		 	try match(ProgryParser.Tokens.OPEN_BRACKET.rawValue)
		 	setState(169)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, ProgryParser.Tokens.OPEN_PARENTHESIS.rawValue,ProgryParser.Tokens.ARRAY.rawValue,ProgryParser.Tokens.READ.rawValue,ProgryParser.Tokens.WRITE.rawValue,ProgryParser.Tokens.IF.rawValue,ProgryParser.Tokens.FOR.rawValue,ProgryParser.Tokens.WHILE.rawValue,ProgryParser.Tokens.ID.rawValue,ProgryParser.Tokens.TEXT.rawValue,ProgryParser.Tokens.DIGIT.rawValue,ProgryParser.Tokens.DECIMAL.rawValue,ProgryParser.Tokens.FLAG.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(166)
		 		try statute()


		 		setState(171)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(172)
		 	try match(ProgryParser.Tokens.CLOSE_BRACKET.rawValue)
		 	setState(180)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == ProgryParser.Tokens.ELSE.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(173)
		 		try match(ProgryParser.Tokens.ELSE.rawValue)
		 		setState(174)
		 		try match(ProgryParser.Tokens.OPEN_BRACKET.rawValue)
		 		setState(175)
		 		try statute()
		 		setState(176)
		 		try match(ProgryParser.Tokens.CLOSE_BRACKET.rawValue)


		 		setState(182)
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

	public class WhilesContext: ParserRuleContext {
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
			return ProgryParser.RULE_whiles
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.enterWhiles(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.exitWhiles(self)
			}
		}
	}
	@discardableResult
	 open func whiles() throws -> WhilesContext {
		var _localctx: WhilesContext
		_localctx = WhilesContext(_ctx, getState())
		try enterRule(_localctx, 26, ProgryParser.RULE_whiles)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(183)
		 	try match(ProgryParser.Tokens.WHILE.rawValue)
		 	setState(184)
		 	try match(ProgryParser.Tokens.OPEN_PARENTHESIS.rawValue)
		 	setState(185)
		 	try g_expr()
		 	setState(186)
		 	try match(ProgryParser.Tokens.CLOSE_PARENTHESIS.rawValue)
		 	setState(187)
		 	try match(ProgryParser.Tokens.DO.rawValue)
		 	setState(188)
		 	try match(ProgryParser.Tokens.OPEN_BRACKET.rawValue)
		 	setState(192)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, ProgryParser.Tokens.OPEN_PARENTHESIS.rawValue,ProgryParser.Tokens.ARRAY.rawValue,ProgryParser.Tokens.READ.rawValue,ProgryParser.Tokens.WRITE.rawValue,ProgryParser.Tokens.IF.rawValue,ProgryParser.Tokens.FOR.rawValue,ProgryParser.Tokens.WHILE.rawValue,ProgryParser.Tokens.ID.rawValue,ProgryParser.Tokens.TEXT.rawValue,ProgryParser.Tokens.DIGIT.rawValue,ProgryParser.Tokens.DECIMAL.rawValue,ProgryParser.Tokens.FLAG.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(189)
		 		try statute()


		 		setState(194)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(195)
		 	try match(ProgryParser.Tokens.CLOSE_BRACKET.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ForsContext: ParserRuleContext {
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
			return ProgryParser.RULE_fors
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.enterFors(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ProgryListener {
				listener.exitFors(self)
			}
		}
	}
	@discardableResult
	 open func fors() throws -> ForsContext {
		var _localctx: ForsContext
		_localctx = ForsContext(_ctx, getState())
		try enterRule(_localctx, 28, ProgryParser.RULE_fors)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(197)
		 	try match(ProgryParser.Tokens.FOR.rawValue)
		 	setState(198)
		 	try match(ProgryParser.Tokens.VAR.rawValue)
		 	setState(199)
		 	try match(ProgryParser.Tokens.ID.rawValue)
		 	setState(200)
		 	try match(ProgryParser.Tokens.EQUAL.rawValue)
		 	setState(203)
		 	try _errHandler.sync(self)
		 	switch (ProgryParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .TEXT:fallthrough
		 	case .DIGIT:fallthrough
		 	case .DECIMAL:fallthrough
		 	case .FLAG:
		 		setState(201)
		 		try cte()

		 		break

		 	case .ID:
		 		setState(202)
		 		try match(ProgryParser.Tokens.ID.rawValue)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		 	setState(205)
		 	try match(ProgryParser.Tokens.TO.rawValue)
		 	setState(208)
		 	try _errHandler.sync(self)
		 	switch (ProgryParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .TEXT:fallthrough
		 	case .DIGIT:fallthrough
		 	case .DECIMAL:fallthrough
		 	case .FLAG:
		 		setState(206)
		 		try cte()

		 		break

		 	case .ID:
		 		setState(207)
		 		try match(ProgryParser.Tokens.ID.rawValue)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		 	setState(210)
		 	try match(ProgryParser.Tokens.OPEN_BRACKET.rawValue)
		 	setState(214)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, ProgryParser.Tokens.OPEN_PARENTHESIS.rawValue,ProgryParser.Tokens.ARRAY.rawValue,ProgryParser.Tokens.READ.rawValue,ProgryParser.Tokens.WRITE.rawValue,ProgryParser.Tokens.IF.rawValue,ProgryParser.Tokens.FOR.rawValue,ProgryParser.Tokens.WHILE.rawValue,ProgryParser.Tokens.ID.rawValue,ProgryParser.Tokens.TEXT.rawValue,ProgryParser.Tokens.DIGIT.rawValue,ProgryParser.Tokens.DECIMAL.rawValue,ProgryParser.Tokens.FLAG.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(211)
		 		try statute()


		 		setState(216)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(217)
		 	try match(ProgryParser.Tokens.CLOSE_BRACKET.rawValue)

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
			func m_expr() -> M_exprContext? {
				return getRuleContext(M_exprContext.self, 0)
			}
			open
			func g_expr() -> G_exprContext? {
				return getRuleContext(G_exprContext.self, 0)
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
			open
			func MORE_AND_THAN() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.MORE_AND_THAN.rawValue, 0)
			}
			open
			func LESS_AND_THAN() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.LESS_AND_THAN.rawValue, 0)
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
		try enterRule(_localctx, 30, ProgryParser.RULE_g_expr)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(224)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,23, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(219)
		 		try m_expr()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(220)
		 		try m_expr()
		 		setState(221)
		 		_la = try _input.LA(1)
		 		if (!(//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, ProgryParser.Tokens.MORE_THAN.rawValue,ProgryParser.Tokens.LESS_THEN.rawValue,ProgryParser.Tokens.MORE_AND_THAN.rawValue,ProgryParser.Tokens.LESS_AND_THAN.rawValue,ProgryParser.Tokens.EQUAL_THAN.rawValue,ProgryParser.Tokens.DIFERENT_THAN.rawValue]
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
		 		setState(222)
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

	public class M_exprContext: ParserRuleContext {
			open
			func t() -> TContext? {
				return getRuleContext(TContext.self, 0)
			}
			open
			func m_expr() -> M_exprContext? {
				return getRuleContext(M_exprContext.self, 0)
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
		try enterRule(_localctx, 32, ProgryParser.RULE_m_expr)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(231)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,24, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(226)
		 		try t()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(227)
		 		try t()
		 		setState(228)
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
		 		setState(229)
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

	public class TContext: ParserRuleContext {
			open
			func f() -> FContext? {
				return getRuleContext(FContext.self, 0)
			}
			open
			func t() -> TContext? {
				return getRuleContext(TContext.self, 0)
			}
			open
			func MULT() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.MULT.rawValue, 0)
			}
			open
			func DIV() -> TerminalNode? {
				return getToken(ProgryParser.Tokens.DIV.rawValue, 0)
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
		try enterRule(_localctx, 34, ProgryParser.RULE_t)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(238)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,25, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(233)
		 		try f()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(234)
		 		try f()
		 		setState(235)
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
		 		setState(236)
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
			func expr() -> ExprContext? {
				return getRuleContext(ExprContext.self, 0)
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
		try enterRule(_localctx, 36, ProgryParser.RULE_f)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(251)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,26, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(240)
		 		try match(ProgryParser.Tokens.ID.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(241)
		 		try match(ProgryParser.Tokens.ID.rawValue)
		 		setState(242)
		 		try match(ProgryParser.Tokens.OPEN_SBRACKET.rawValue)
		 		setState(243)
		 		try m_expr()
		 		setState(244)
		 		try match(ProgryParser.Tokens.CLOSE_SBRACKET.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(246)
		 		try cte()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(247)
		 		try match(ProgryParser.Tokens.OPEN_PARENTHESIS.rawValue)
		 		setState(248)
		 		try expr()
		 		setState(249)
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
		4,1,50,254,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,2,7,
		7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,2,14,7,14,
		2,15,7,15,2,16,7,16,2,17,7,17,2,18,7,18,1,0,1,0,1,0,3,0,42,8,0,1,0,3,0,
		45,8,0,1,0,1,0,1,0,1,0,1,0,1,1,1,1,1,1,3,1,55,8,1,1,1,3,1,58,8,1,1,1,1,
		1,1,2,1,2,1,2,1,2,1,2,3,2,67,8,2,1,2,1,2,3,2,71,8,2,1,2,4,2,74,8,2,11,
		2,12,2,75,3,2,78,8,2,1,2,1,2,1,2,1,3,1,3,1,4,4,4,86,8,4,11,4,12,4,87,1,
		4,1,4,1,4,3,4,93,8,4,1,5,1,5,1,5,1,5,1,5,1,5,1,5,1,5,3,5,103,8,5,1,6,1,
		6,1,6,1,6,1,6,1,7,1,7,1,7,1,7,1,8,1,8,1,8,1,8,1,8,3,8,119,8,8,1,9,1,9,
		1,9,1,9,1,9,1,10,1,10,1,10,1,10,1,10,3,10,131,8,10,1,10,1,10,1,10,1,10,
		4,10,137,8,10,11,10,12,10,138,5,10,141,8,10,10,10,12,10,144,9,10,1,10,
		1,10,1,10,1,11,1,11,1,11,1,11,1,11,1,11,5,11,155,8,11,10,11,12,11,158,
		9,11,1,11,1,11,1,12,1,12,1,12,1,12,1,12,1,12,5,12,168,8,12,10,12,12,12,
		171,9,12,1,12,1,12,1,12,1,12,1,12,1,12,5,12,179,8,12,10,12,12,12,182,9,
		12,1,13,1,13,1,13,1,13,1,13,1,13,1,13,5,13,191,8,13,10,13,12,13,194,9,
		13,1,13,1,13,1,14,1,14,1,14,1,14,1,14,1,14,3,14,204,8,14,1,14,1,14,1,14,
		3,14,209,8,14,1,14,1,14,5,14,213,8,14,10,14,12,14,216,9,14,1,14,1,14,1,
		15,1,15,1,15,1,15,1,15,3,15,225,8,15,1,16,1,16,1,16,1,16,1,16,3,16,232,
		8,16,1,17,1,17,1,17,1,17,1,17,3,17,239,8,17,1,18,1,18,1,18,1,18,1,18,1,
		18,1,18,1,18,1,18,1,18,1,18,3,18,252,8,18,1,18,0,0,19,0,2,4,6,8,10,12,
		14,16,18,20,22,24,26,28,30,32,34,36,0,5,1,0,29,32,1,0,6,7,1,0,8,13,1,0,
		1,2,1,0,3,4,273,0,38,1,0,0,0,2,51,1,0,0,0,4,61,1,0,0,0,6,82,1,0,0,0,8,
		92,1,0,0,0,10,102,1,0,0,0,12,104,1,0,0,0,14,109,1,0,0,0,16,118,1,0,0,0,
		18,120,1,0,0,0,20,125,1,0,0,0,22,148,1,0,0,0,24,161,1,0,0,0,26,183,1,0,
		0,0,28,197,1,0,0,0,30,224,1,0,0,0,32,231,1,0,0,0,34,238,1,0,0,0,36,251,
		1,0,0,0,38,39,5,23,0,0,39,41,5,26,0,0,40,42,3,18,9,0,41,40,1,0,0,0,41,
		42,1,0,0,0,42,44,1,0,0,0,43,45,3,4,2,0,44,43,1,0,0,0,44,45,1,0,0,0,45,
		46,1,0,0,0,46,47,3,2,1,0,47,48,5,24,0,0,48,49,5,26,0,0,49,50,5,0,0,1,50,
		1,1,0,0,0,51,52,5,21,0,0,52,54,5,16,0,0,53,55,3,18,9,0,54,53,1,0,0,0,54,
		55,1,0,0,0,55,57,1,0,0,0,56,58,3,10,5,0,57,56,1,0,0,0,57,58,1,0,0,0,58,
		59,1,0,0,0,59,60,5,17,0,0,60,3,1,0,0,0,61,62,5,20,0,0,62,63,5,43,0,0,63,
		66,5,25,0,0,64,67,3,6,3,0,65,67,5,42,0,0,66,64,1,0,0,0,66,65,1,0,0,0,67,
		68,1,0,0,0,68,70,5,16,0,0,69,71,3,18,9,0,70,69,1,0,0,0,70,71,1,0,0,0,71,
		77,1,0,0,0,72,74,3,10,5,0,73,72,1,0,0,0,74,75,1,0,0,0,75,73,1,0,0,0,75,
		76,1,0,0,0,76,78,1,0,0,0,77,73,1,0,0,0,77,78,1,0,0,0,78,79,1,0,0,0,79,
		80,5,41,0,0,80,81,5,17,0,0,81,5,1,0,0,0,82,83,7,0,0,0,83,7,1,0,0,0,84,
		86,5,46,0,0,85,84,1,0,0,0,86,87,1,0,0,0,87,85,1,0,0,0,87,88,1,0,0,0,88,
		93,1,0,0,0,89,93,5,47,0,0,90,93,5,44,0,0,91,93,5,49,0,0,92,85,1,0,0,0,
		92,89,1,0,0,0,92,90,1,0,0,0,92,91,1,0,0,0,93,9,1,0,0,0,94,103,3,12,6,0,
		95,103,3,14,7,0,96,103,3,20,10,0,97,103,3,22,11,0,98,103,3,24,12,0,99,
		103,3,26,13,0,100,103,3,28,14,0,101,103,3,16,8,0,102,94,1,0,0,0,102,95,
		1,0,0,0,102,96,1,0,0,0,102,97,1,0,0,0,102,98,1,0,0,0,102,99,1,0,0,0,102,
		100,1,0,0,0,102,101,1,0,0,0,103,11,1,0,0,0,104,105,5,43,0,0,105,106,5,
		5,0,0,106,107,3,32,16,0,107,108,5,26,0,0,108,13,1,0,0,0,109,110,5,33,0,
		0,110,111,5,43,0,0,111,112,5,26,0,0,112,15,1,0,0,0,113,119,3,30,15,0,114,
		115,3,30,15,0,115,116,7,1,0,0,116,117,3,16,8,0,117,119,1,0,0,0,118,113,
		1,0,0,0,118,114,1,0,0,0,119,17,1,0,0,0,120,121,5,28,0,0,121,122,3,6,3,
		0,122,123,5,43,0,0,123,124,5,26,0,0,124,19,1,0,0,0,125,126,5,34,0,0,126,
		130,5,14,0,0,127,131,3,32,16,0,128,131,3,8,4,0,129,131,5,43,0,0,130,127,
		1,0,0,0,130,128,1,0,0,0,130,129,1,0,0,0,131,142,1,0,0,0,132,136,5,27,0,
		0,133,137,3,32,16,0,134,137,3,8,4,0,135,137,5,43,0,0,136,133,1,0,0,0,136,
		134,1,0,0,0,136,135,1,0,0,0,137,138,1,0,0,0,138,136,1,0,0,0,138,139,1,
		0,0,0,139,141,1,0,0,0,140,132,1,0,0,0,141,144,1,0,0,0,142,140,1,0,0,0,
		142,143,1,0,0,0,143,145,1,0,0,0,144,142,1,0,0,0,145,146,5,15,0,0,146,147,
		5,26,0,0,147,21,1,0,0,0,148,149,5,22,0,0,149,150,3,6,3,0,150,151,5,14,
		0,0,151,152,3,8,4,0,152,156,5,27,0,0,153,155,3,8,4,0,154,153,1,0,0,0,155,
		158,1,0,0,0,156,154,1,0,0,0,156,157,1,0,0,0,157,159,1,0,0,0,158,156,1,
		0,0,0,159,160,5,15,0,0,160,23,1,0,0,0,161,162,5,35,0,0,162,163,5,14,0,
		0,163,164,3,16,8,0,164,165,5,15,0,0,165,169,5,16,0,0,166,168,3,10,5,0,
		167,166,1,0,0,0,168,171,1,0,0,0,169,167,1,0,0,0,169,170,1,0,0,0,170,172,
		1,0,0,0,171,169,1,0,0,0,172,180,5,17,0,0,173,174,5,36,0,0,174,175,5,16,
		0,0,175,176,3,10,5,0,176,177,5,17,0,0,177,179,1,0,0,0,178,173,1,0,0,0,
		179,182,1,0,0,0,180,178,1,0,0,0,180,181,1,0,0,0,181,25,1,0,0,0,182,180,
		1,0,0,0,183,184,5,38,0,0,184,185,5,14,0,0,185,186,3,30,15,0,186,187,5,
		15,0,0,187,188,5,39,0,0,188,192,5,16,0,0,189,191,3,10,5,0,190,189,1,0,
		0,0,191,194,1,0,0,0,192,190,1,0,0,0,192,193,1,0,0,0,193,195,1,0,0,0,194,
		192,1,0,0,0,195,196,5,17,0,0,196,27,1,0,0,0,197,198,5,37,0,0,198,199,5,
		28,0,0,199,200,5,43,0,0,200,203,5,5,0,0,201,204,3,8,4,0,202,204,5,43,0,
		0,203,201,1,0,0,0,203,202,1,0,0,0,204,205,1,0,0,0,205,208,5,40,0,0,206,
		209,3,8,4,0,207,209,5,43,0,0,208,206,1,0,0,0,208,207,1,0,0,0,209,210,1,
		0,0,0,210,214,5,16,0,0,211,213,3,10,5,0,212,211,1,0,0,0,213,216,1,0,0,
		0,214,212,1,0,0,0,214,215,1,0,0,0,215,217,1,0,0,0,216,214,1,0,0,0,217,
		218,5,17,0,0,218,29,1,0,0,0,219,225,3,32,16,0,220,221,3,32,16,0,221,222,
		7,2,0,0,222,223,3,30,15,0,223,225,1,0,0,0,224,219,1,0,0,0,224,220,1,0,
		0,0,225,31,1,0,0,0,226,232,3,34,17,0,227,228,3,34,17,0,228,229,7,3,0,0,
		229,230,3,32,16,0,230,232,1,0,0,0,231,226,1,0,0,0,231,227,1,0,0,0,232,
		33,1,0,0,0,233,239,3,36,18,0,234,235,3,36,18,0,235,236,7,4,0,0,236,237,
		3,34,17,0,237,239,1,0,0,0,238,233,1,0,0,0,238,234,1,0,0,0,239,35,1,0,0,
		0,240,252,5,43,0,0,241,242,5,43,0,0,242,243,5,18,0,0,243,244,3,32,16,0,
		244,245,5,19,0,0,245,252,1,0,0,0,246,252,3,8,4,0,247,248,5,14,0,0,248,
		249,3,16,8,0,249,250,5,15,0,0,250,252,1,0,0,0,251,240,1,0,0,0,251,241,
		1,0,0,0,251,246,1,0,0,0,251,247,1,0,0,0,252,37,1,0,0,0,27,41,44,54,57,
		66,70,75,77,87,92,102,118,130,136,138,142,156,169,180,192,203,208,214,
		224,231,238,251
	]

	public
	static let _ATN = try! ATNDeserializer().deserialize(_serializedATN)
}