//
//  APIResponse.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//


enum APIResponse<T> {
    
    case success(T)
    case failure(APIError)
    case complete
}
