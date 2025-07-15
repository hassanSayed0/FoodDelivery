//
//  Response.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//

enum Response<T> {

    case onSuccess(T)
    case onFailure(APIError)
    case onCompleted
}
