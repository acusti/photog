//
//  String+Extensions.swift
//  Photog
//
//  Created by Andrew Patton on 2015-01-12.
//  Copyright (c) 2015 acusti.ca. All rights reserved.
//

import Foundation

extension String
{
    func isEmailAddress() -> Bool
    {
        var predicate = self.predicateForEmail()
        return predicate.evaluateWithObject(self)
    }
    
    func predicateForEmail() -> NSPredicate!
    {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        return NSPredicate(format: "SELF MATCHES %@", regex)
    }
}