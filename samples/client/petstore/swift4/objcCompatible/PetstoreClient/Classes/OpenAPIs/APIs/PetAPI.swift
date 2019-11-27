//
// PetAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

open class PetAPI {
    /**
     Add a new pet to the store
     
     - parameter body: (body) Pet object that needs to be added to the store 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func addPet(body: Pet, completion: @escaping ((_ data: Void?, _ error: Error?) -> Void)) {
        addPetWithRequestBuilder(body: body).execute { (_, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }

    /**
     Add a new pet to the store
     - POST /pet
     - OAuth:
       - type: oauth2
       - name: petstore_auth
     - parameter body: (body) Pet object that needs to be added to the store 
     - returns: RequestBuilder<Void> 
     */
    open class func addPetWithRequestBuilder(body: Pet) -> RequestBuilder<Void> {
        let path = "/pet"
        let URLString = PetstoreClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = PetstoreClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     Deletes a pet
     
     - parameter petId: (path) Pet id to delete 
     - parameter apiKey: (header)  (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deletePet(petId: Int64, apiKey: String? = nil, completion: @escaping ((_ data: Void?, _ error: Error?) -> Void)) {
        deletePetWithRequestBuilder(petId: petId, apiKey: apiKey).execute { (_, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }

    /**
     Deletes a pet
     - DELETE /pet/{petId}
     - OAuth:
       - type: oauth2
       - name: petstore_auth
     - parameter petId: (path) Pet id to delete 
     - parameter apiKey: (header)  (optional)
     - returns: RequestBuilder<Void> 
     */
    open class func deletePetWithRequestBuilder(petId: Int64, apiKey: String? = nil) -> RequestBuilder<Void> {
        var path = "/pet/{petId}"
        let petIdPreEscape = "\(APIHelper.mapValueToPathItem(petId))"
        let petIdPostEscape = petIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{petId}", with: petIdPostEscape, options: .literal, range: nil)
        let URLString = PetstoreClientAPI.basePath + path
        let parameters: [String: Any]? = nil

        let url = URLComponents(string: URLString)
        let nillableHeaders: [String: Any?] = [
            "api_key": apiKey
        ]
        let headerParameters = APIHelper.rejectNilHeaders(nillableHeaders)

        let requestBuilder: RequestBuilder<Void>.Type = PetstoreClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false, headers: headerParameters)
    }

    /**
     * enum for parameter status
     */
    public enum Status_findPetsByStatus: String {
        case available = "available"
        case pending = "pending"
        case sold = "sold"
    }

    /**
     Finds Pets by status
     
     - parameter status: (query) Status values that need to be considered for filter 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func findPetsByStatus(status: [String], completion: @escaping ((_ data: [Pet]?, _ error: Error?) -> Void)) {
        findPetsByStatusWithRequestBuilder(status: status).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Finds Pets by status
     - GET /pet/findByStatus
     - Multiple status values can be provided with comma separated strings
     - OAuth:
       - type: oauth2
       - name: petstore_auth
     - parameter status: (query) Status values that need to be considered for filter 
     - returns: RequestBuilder<[Pet]> 
     */
    open class func findPetsByStatusWithRequestBuilder(status: [String]) -> RequestBuilder<[Pet]> {
        let path = "/pet/findByStatus"
        let URLString = PetstoreClientAPI.basePath + path
        let parameters: [String: Any]? = nil

        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "status": status
        ])

        let requestBuilder: RequestBuilder<[Pet]>.Type = PetstoreClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Finds Pets by tags
     
     - parameter tags: (query) Tags to filter by 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func findPetsByTags(tags: [String], completion: @escaping ((_ data: [Pet]?, _ error: Error?) -> Void)) {
        findPetsByTagsWithRequestBuilder(tags: tags).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Finds Pets by tags
     - GET /pet/findByTags
     - Multiple tags can be provided with comma separated strings. Use tag1, tag2, tag3 for testing.
     - OAuth:
       - type: oauth2
       - name: petstore_auth
     - parameter tags: (query) Tags to filter by 
     - returns: RequestBuilder<[Pet]> 
     */
    open class func findPetsByTagsWithRequestBuilder(tags: [String]) -> RequestBuilder<[Pet]> {
        let path = "/pet/findByTags"
        let URLString = PetstoreClientAPI.basePath + path
        let parameters: [String: Any]? = nil

        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "tags": tags
        ])

        let requestBuilder: RequestBuilder<[Pet]>.Type = PetstoreClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Find pet by ID
     
     - parameter petId: (path) ID of pet to return 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getPetById(petId: Int64, completion: @escaping ((_ data: Pet?, _ error: Error?) -> Void)) {
        getPetByIdWithRequestBuilder(petId: petId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Find pet by ID
     - GET /pet/{petId}
     - Returns a single pet
     - API Key:
       - type: apiKey api_key 
       - name: api_key
     - parameter petId: (path) ID of pet to return 
     - returns: RequestBuilder<Pet> 
     */
    open class func getPetByIdWithRequestBuilder(petId: Int64) -> RequestBuilder<Pet> {
        var path = "/pet/{petId}"
        let petIdPreEscape = "\(APIHelper.mapValueToPathItem(petId))"
        let petIdPostEscape = petIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{petId}", with: petIdPostEscape, options: .literal, range: nil)
        let URLString = PetstoreClientAPI.basePath + path
        let parameters: [String: Any]? = nil

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Pet>.Type = PetstoreClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Update an existing pet
     
     - parameter body: (body) Pet object that needs to be added to the store 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func updatePet(body: Pet, completion: @escaping ((_ data: Void?, _ error: Error?) -> Void)) {
        updatePetWithRequestBuilder(body: body).execute { (_, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }

    /**
     Update an existing pet
     - PUT /pet
     - OAuth:
       - type: oauth2
       - name: petstore_auth
     - parameter body: (body) Pet object that needs to be added to the store 
     - returns: RequestBuilder<Void> 
     */
    open class func updatePetWithRequestBuilder(body: Pet) -> RequestBuilder<Void> {
        let path = "/pet"
        let URLString = PetstoreClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = PetstoreClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "PUT", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     Updates a pet in the store with form data
     
     - parameter petId: (path) ID of pet that needs to be updated 
     - parameter name: (form) Updated name of the pet (optional)
     - parameter status: (form) Updated status of the pet (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func updatePetWithForm(petId: Int64, name: String? = nil, status: String? = nil, completion: @escaping ((_ data: Void?, _ error: Error?) -> Void)) {
        updatePetWithFormWithRequestBuilder(petId: petId, name: name, status: status).execute { (_, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }

    /**
     Updates a pet in the store with form data
     - POST /pet/{petId}
     - OAuth:
       - type: oauth2
       - name: petstore_auth
     - parameter petId: (path) ID of pet that needs to be updated 
     - parameter name: (form) Updated name of the pet (optional)
     - parameter status: (form) Updated status of the pet (optional)
     - returns: RequestBuilder<Void> 
     */
    open class func updatePetWithFormWithRequestBuilder(petId: Int64, name: String? = nil, status: String? = nil) -> RequestBuilder<Void> {
        var path = "/pet/{petId}"
        let petIdPreEscape = "\(APIHelper.mapValueToPathItem(petId))"
        let petIdPostEscape = petIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{petId}", with: petIdPostEscape, options: .literal, range: nil)
        let URLString = PetstoreClientAPI.basePath + path
        let formParams: [String: Any?] = [
            "name": name,
            "status": status
        ]

        let nonNullParameters = APIHelper.rejectNil(formParams)
        let parameters = APIHelper.convertBoolToString(nonNullParameters)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = PetstoreClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     uploads an image
     
     - parameter petId: (path) ID of pet to update 
     - parameter additionalMetadata: (form) Additional data to pass to server (optional)
     - parameter file: (form) file to upload (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func uploadFile(petId: Int64, additionalMetadata: String? = nil, file: URL? = nil, completion: @escaping ((_ data: ApiResponse?, _ error: Error?) -> Void)) {
        uploadFileWithRequestBuilder(petId: petId, additionalMetadata: additionalMetadata, file: file).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     uploads an image
     - POST /pet/{petId}/uploadImage
     - OAuth:
       - type: oauth2
       - name: petstore_auth
     - parameter petId: (path) ID of pet to update 
     - parameter additionalMetadata: (form) Additional data to pass to server (optional)
     - parameter file: (form) file to upload (optional)
     - returns: RequestBuilder<ApiResponse> 
     */
    open class func uploadFileWithRequestBuilder(petId: Int64, additionalMetadata: String? = nil, file: URL? = nil) -> RequestBuilder<ApiResponse> {
        var path = "/pet/{petId}/uploadImage"
        let petIdPreEscape = "\(APIHelper.mapValueToPathItem(petId))"
        let petIdPostEscape = petIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{petId}", with: petIdPostEscape, options: .literal, range: nil)
        let URLString = PetstoreClientAPI.basePath + path
        let formParams: [String: Any?] = [
            "additionalMetadata": additionalMetadata,
            "file": file
        ]

        let nonNullParameters = APIHelper.rejectNil(formParams)
        let parameters = APIHelper.convertBoolToString(nonNullParameters)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<ApiResponse>.Type = PetstoreClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     uploads an image (required)
     
     - parameter petId: (path) ID of pet to update 
     - parameter requiredFile: (form) file to upload 
     - parameter additionalMetadata: (form) Additional data to pass to server (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func uploadFileWithRequiredFile(petId: Int64, requiredFile: URL, additionalMetadata: String? = nil, completion: @escaping ((_ data: ApiResponse?, _ error: Error?) -> Void)) {
        uploadFileWithRequiredFileWithRequestBuilder(petId: petId, requiredFile: requiredFile, additionalMetadata: additionalMetadata).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     uploads an image (required)
     - POST /fake/{petId}/uploadImageWithRequiredFile
     - OAuth:
       - type: oauth2
       - name: petstore_auth
     - parameter petId: (path) ID of pet to update 
     - parameter requiredFile: (form) file to upload 
     - parameter additionalMetadata: (form) Additional data to pass to server (optional)
     - returns: RequestBuilder<ApiResponse> 
     */
    open class func uploadFileWithRequiredFileWithRequestBuilder(petId: Int64, requiredFile: URL, additionalMetadata: String? = nil) -> RequestBuilder<ApiResponse> {
        var path = "/fake/{petId}/uploadImageWithRequiredFile"
        let petIdPreEscape = "\(APIHelper.mapValueToPathItem(petId))"
        let petIdPostEscape = petIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{petId}", with: petIdPostEscape, options: .literal, range: nil)
        let URLString = PetstoreClientAPI.basePath + path
        let formParams: [String: Any?] = [
            "additionalMetadata": additionalMetadata,
            "requiredFile": requiredFile
        ]

        let nonNullParameters = APIHelper.rejectNil(formParams)
        let parameters = APIHelper.convertBoolToString(nonNullParameters)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<ApiResponse>.Type = PetstoreClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
