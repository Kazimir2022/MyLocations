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

let applicationDocumentsDirectory: URL = {
  let paths = FileManager.default.urls(
    for: .documentDirectory,
       in: .userDomainMask)
  return paths[0]
}()

