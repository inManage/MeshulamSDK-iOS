// Generated by Apple Swift version 5.6.1 (swiftlang-5.6.0.323.66 clang-1316.0.20.12)
#ifndef MESHULAMSDK_SWIFT_H
#define MESHULAMSDK_SWIFT_H
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgcc-compat"

#if !defined(__has_include)
# define __has_include(x) 0
#endif
#if !defined(__has_attribute)
# define __has_attribute(x) 0
#endif
#if !defined(__has_feature)
# define __has_feature(x) 0
#endif
#if !defined(__has_warning)
# define __has_warning(x) 0
#endif

#if __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <Foundation/Foundation.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus)
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if __has_attribute(ns_consumed)
# define SWIFT_RELEASES_ARGUMENT __attribute__((ns_consumed))
#else
# define SWIFT_RELEASES_ARGUMENT
#endif
#if __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if __has_attribute(noreturn)
# define SWIFT_NORETURN __attribute__((noreturn))
#else
# define SWIFT_NORETURN
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif
#if !defined(SWIFT_RESILIENT_CLASS)
# if __has_attribute(objc_class_stub)
#  define SWIFT_RESILIENT_CLASS(SWIFT_NAME) SWIFT_CLASS(SWIFT_NAME) __attribute__((objc_class_stub))
#  define SWIFT_RESILIENT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_class_stub)) SWIFT_CLASS_NAMED(SWIFT_NAME)
# else
#  define SWIFT_RESILIENT_CLASS(SWIFT_NAME) SWIFT_CLASS(SWIFT_NAME)
#  define SWIFT_RESILIENT_CLASS_NAMED(SWIFT_NAME) SWIFT_CLASS_NAMED(SWIFT_NAME)
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM_ATTR)
# if defined(__has_attribute) && __has_attribute(enum_extensibility)
#  define SWIFT_ENUM_ATTR(_extensibility) __attribute__((enum_extensibility(_extensibility)))
# else
#  define SWIFT_ENUM_ATTR(_extensibility)
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name, _extensibility) enum _name : _type _name; enum SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# if __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) SWIFT_ENUM(_type, _name, _extensibility)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_WEAK_IMPORT)
# define SWIFT_WEAK_IMPORT __attribute__((weak_import))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if __has_feature(attribute_diagnose_if_objc)
# define SWIFT_DEPRECATED_OBJC(Msg) __attribute__((diagnose_if(1, Msg, "warning")))
#else
# define SWIFT_DEPRECATED_OBJC(Msg) SWIFT_DEPRECATED_MSG(Msg)
#endif
#if !defined(IBSegueAction)
# define IBSegueAction
#endif
#if !defined(SWIFT_EXTERN)
# if defined(__cplusplus)
#  define SWIFT_EXTERN extern "C"
# else
#  define SWIFT_EXTERN extern
# endif
#endif
#if __has_feature(modules)
#if __has_warning("-Watimport-in-framework-header")
#pragma clang diagnostic ignored "-Watimport-in-framework-header"
#endif
@import Foundation;
@import ObjectiveC;
@import UIKit;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"

#if __has_attribute(external_source_symbol)
# pragma push_macro("any")
# undef any
# pragma clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in="MeshulamSDK",generated_declaration))), apply_to=any(function,enum,objc_interface,objc_category,objc_protocol))
# pragma pop_macro("any")
#endif

@class NSString;

SWIFT_CLASS("_TtC11MeshulamSDK17BaseInnerResponse")
@interface BaseInnerResponse : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
- (BaseInnerResponse * _Nonnull)buildFromJSONDictWithJSONDict:(NSDictionary<NSString *, id> * _Nonnull)JSONDict;
@end


SWIFT_CLASS("_TtC11MeshulamSDK28CreatePaymentProcessResponse")
@interface CreatePaymentProcessResponse : BaseInnerResponse
- (BaseInnerResponse * _Nonnull)buildFromJSONDictWithJSONDict:(NSDictionary<NSString *, id> * _Nonnull)JSONDict SWIFT_WARN_UNUSED_RESULT;
@end


SWIFT_CLASS("_TtC11MeshulamSDK5Error")
@interface Error : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC11MeshulamSDK13ErrorResponse")
@interface ErrorResponse : BaseInnerResponse
- (BaseInnerResponse * _Nonnull)buildFromJSONDictWithJSONDict:(NSDictionary<NSString *, id> * _Nonnull)JSONDict SWIFT_WARN_UNUSED_RESULT;
@end


SWIFT_CLASS("_TtC11MeshulamSDK19MeshulamBaseRequest")
@interface MeshulamBaseRequest : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC11MeshulamSDK14InitSDKRequest")
@interface InitSDKRequest : MeshulamBaseRequest
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC11MeshulamSDK15InitSDKResponse")
@interface InitSDKResponse : BaseInnerResponse
- (BaseInnerResponse * _Nonnull)buildFromJSONDictWithJSONDict:(NSDictionary<NSString *, id> * _Nonnull)JSONDict SWIFT_WARN_UNUSED_RESULT;
@end

@protocol MeshulamDelegate;
@class MeshulamPaymentFields;
@class UIApplication;
@class NSURL;

SWIFT_CLASS("_TtC11MeshulamSDK8Meshulam")
@interface Meshulam : NSObject
@property (nonatomic, weak) id <MeshulamDelegate> _Nullable delegate;
@property (nonatomic) BOOL isDebugMode;
/// Initialize <code>Meshulam</code> (as singleton)
/// Returns the default singleton instance. You are not allowed to create your own instances of this class.
+ (Meshulam * _Nonnull)shared SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
- (void)createPaymentProcessWithPageCode:(NSString * _Nonnull)pageCode apiKey:(NSString * _Nonnull)apiKey userId:(NSString * _Nonnull)userId fullName:(NSString * _Nonnull)fullName phoneNumber:(NSString * _Nonnull)phoneNumber sum:(NSString * _Nonnull)sum email:(NSString * _Nullable)email description:(NSString * _Nullable)description saveCardToken:(NSString * _Nullable)saveCardToken companyCommission:(NSString * _Nullable)companyCommission delegate:(id <MeshulamDelegate> _Nullable)delegate;
- (void)createPaymentProcessWithPaymentFeilds:(MeshulamPaymentFields * _Nonnull)paymentFeilds delegate:(id <MeshulamDelegate> _Nullable)delegate;
- (void)settleSuspendedTransactionWithApiKey:(NSString * _Nonnull)apiKey userId:(NSString * _Nonnull)userId pageCode:(NSString * _Nonnull)pageCode sum:(NSString * _Nonnull)sum transactionId:(NSString * _Nonnull)transactionId delegate:(id <MeshulamDelegate> _Nullable)delegate;
- (void)getPaymentProcessInfoWithProcessId:(NSString * _Nonnull)processId processToken:(NSString * _Nonnull)processToken pageCode:(NSString * _Nonnull)pageCode delegate:(id <MeshulamDelegate> _Nullable)delegate;
- (void)cancelBitTransactionWithProcessId:(NSString * _Nonnull)processId processToken:(NSString * _Nonnull)processToken pageCode:(NSString * _Nonnull)pageCode delegate:(id <MeshulamDelegate> _Nullable)delegate;
- (void)application:(UIApplication * _Nonnull)app open:(NSURL * _Nonnull)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> * _Nonnull)options;
@end



SWIFT_PROTOCOL("_TtP11MeshulamSDK16MeshulamDelegate_")
@protocol MeshulamDelegate <NSObject>
- (void)setBitPaymentSuccess:(NSString * _Nonnull)transactionId;
- (void)settleSuspendedTransactionSuccessWithResponse:(NSDictionary<NSString *, id> * _Nonnull)response;
- (void)createPaymentProccesSuccess:(NSString * _Nonnull)processId :(NSString * _Nonnull)processToken;
- (void)getPaymentProcessInfoSuccessWithResponse:(NSDictionary<NSString *, id> * _Nonnull)response;
- (void)onFailure:(NSString * _Nonnull)error;
- (void)onCancel;
- (void)didCloseMeshulamSDK;
@end


SWIFT_CLASS("_TtC11MeshulamSDK22MeshulamNetworkManager")
@interface MeshulamNetworkManager : NSObject
- (void)updateTimer;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end



SWIFT_CLASS("_TtC11MeshulamSDK21MeshulamPaymentFields")
@interface MeshulamPaymentFields : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC11MeshulamSDK20MeshulamPopupManager")
@interface MeshulamPopupManager : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end



SWIFT_CLASS("_TtC11MeshulamSDK26PaymentProcessResponseInfo")
@interface PaymentProcessResponseInfo : BaseInnerResponse
- (BaseInnerResponse * _Nonnull)buildFromJSONDictWithJSONDict:(NSDictionary<NSString *, id> * _Nonnull)JSONDict SWIFT_WARN_UNUSED_RESULT;
@end


SWIFT_CLASS("_TtC11MeshulamSDK21SetBitPaymentResponse")
@interface SetBitPaymentResponse : BaseInnerResponse
- (BaseInnerResponse * _Nonnull)buildFromJSONDictWithJSONDict:(NSDictionary<NSString *, id> * _Nonnull)JSONDict SWIFT_WARN_UNUSED_RESULT;
@end


SWIFT_CLASS("_TtC11MeshulamSDK12Transactions")
@interface Transactions : BaseInnerResponse
- (BaseInnerResponse * _Nonnull)buildFromJSONDictWithJSONDict:(NSDictionary<NSString *, id> * _Nonnull)JSONDict SWIFT_WARN_UNUSED_RESULT;
@end





#if __has_attribute(external_source_symbol)
# pragma clang attribute pop
#endif
#pragma clang diagnostic pop
#endif
