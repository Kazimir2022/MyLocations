//
//  Functions.swift
//  MyLocations
//
//  Created by Kazimir on 9.09.23.
//

import Foundation

func afterDelay(_ seconds: Double, run: @escaping () -> Void) {
  DispatchQueue.main.asyncAfter(
    deadline: .now() + seconds,
    execute: run)
}
