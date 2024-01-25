//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Foundation
import Moya
import Combine

public class DefaultRequestHandler: RequestHandler {
    let errorHandler: ErrorHandler
    let parseHandler: ParseHandler
    let keyPath: String?
    
    public convenience init(at keyPath: String? = nil) {
        self.init(
            errorHandler: ApiErrorHandler(),
            parseHandler: CodableParseHandler(),
            at: keyPath
        )
    }
    
    public init(
        errorHandler: ErrorHandler = ApiErrorHandler(),
        parseHandler: ParseHandler = CodableParseHandler(),
        at keyPath: String? = nil
    ) {
        self.errorHandler = errorHandler
        self.parseHandler = parseHandler
        self.keyPath = keyPath
    }
    
    public var successStatusRange: ClosedRange<Int> { 200 ... 299 }
    
    public func handle<Model>(response: Response) throws -> Model where Model : Decodable {
        guard successStatusRange ~= response.statusCode else {
            let error = errorHandler.handleError(from: response)
            throw error
        }
        
        let model: Model
        do {
            model = try parseHandler.parse(response, at: keyPath)
        } catch {
            throw error
        }
        
        return model
    }
    
    public func handleVoid(response: Response) throws {
        if successStatusRange ~= response.statusCode {
            return
        }
        
        throw errorHandler.handleError(from: response)
    }
}
