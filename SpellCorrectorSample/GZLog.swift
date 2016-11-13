//
//  GZLog.swift
//
//  Created by C.H Lee on 7/16/14.
//  Copyright (c) 2014 C.H Lee. All rights reserved.
//

import Foundation

var debugDateFormatter = DateFormatter()

let DEBUG_FLAG:Bool = true

class DebugUtil {
    
    class var formatter:DateFormatter {
        debugDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        return debugDateFormatter
    }
    
    class func notNilObj(_ obj:Any?) -> Any {
        if let a: Any = obj {
            return a
        }
        return "nil" as AnyObject
    }
}

class GZLog {
    class func Func(_ obj:Any?, function:String=#function,file:NSString=#file, line:Int=#line)->Void {
        
        //    NSLog("[%@ %@](%d) %@", file.lastPathComponent.stringByDeletingPathExtension, function, line, obj)
        if DEBUG_FLAG {
            print("\(DebugUtil.formatter.string(from: Date())) [\(file.lastPathComponent) \(function)](\(line)) \(DebugUtil.notNilObj(obj))")
        }
    }
    
    class func Func(function:String=#function,file:NSString=#file, line:Int=#line)->Void {
        
        //    NSLog("[%@ %@](%d)", file.lastPathComponent.stringByDeletingPathExtension, function, line)
        if DEBUG_FLAG {
            print("\(DebugUtil.formatter.string(from: Date())) [\(file.lastPathComponent) \(function)](\(line))")
        }
    }
}

func GZLogFunc(_ obj:Any?, function:String=#function,file:NSString=#file, line:Int=#line)->Void {
    GZLog.Func(obj, function:function, file:file, line:line)
}

func GZLogFunc(_ function:String=#function,file:NSString=#file, line:Int=#line)->Void {
    GZLog.Func(function:function, file:file, line:line)
}

func GZLogFunc0(_ function:String=#function,file:NSString=#file, line:Int=#line)->Void {
    
    GZLog.Func("" as AnyObject?, function:function, file:file, line:line)
}
