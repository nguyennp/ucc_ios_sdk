// Generated by Apple Swift version 5.3.2 (swiftlang-1200.0.45 clang-1200.0.32.28)
#ifndef VNPTVIDEOCALLSDK_SWIFT_H
#define VNPTVIDEOCALLSDK_SWIFT_H
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
#if __has_feature(modules)
#if __has_warning("-Watimport-in-framework-header")
#pragma clang diagnostic ignored "-Watimport-in-framework-header"
#endif
@import CallKit;
@import Foundation;
@import ObjectiveC;
@import PushKit;
@import SocketRocket;
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
# pragma clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in="VNPTVideoCallSDK",generated_declaration))), apply_to=any(function,enum,objc_interface,objc_category,objc_protocol))
# pragma pop_macro("any")
#endif


@class CallingPerson;

SWIFT_CLASS("_TtC16VNPTVideoCallSDK20CallProviderDelegate")
@interface CallProviderDelegate : NSObject
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, strong) CallProviderDelegate * _Nonnull shared;)
+ (CallProviderDelegate * _Nonnull)shared SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
- (void)configurePushKit;
- (void)reportIncomingCall:(CallingPerson * _Nonnull)data completion:(void (^ _Nonnull)(void))completion;
- (void)outgoingCall:(CallingPerson * _Nonnull)data completion:(void (^ _Nonnull)(NSError * _Nullable))completion;
- (void)endCallWithCall:(CallingPerson * _Nonnull)call completion:(void (^ _Nonnull)(NSError * _Nullable))completion;
- (void)acceptCall:(CallingPerson * _Nonnull)data;
- (void)reportCall:(CallingPerson * _Nullable)data reason:(CXCallEndedReason)reason;
@end


@interface CallProviderDelegate (SWIFT_EXTENSION(VNPTVideoCallSDK))
- (void)handlingCallPushWithData:(CallingPerson * _Nonnull)data;
@end

@class CXCallObserver;
@class CXCall;

@interface CallProviderDelegate (SWIFT_EXTENSION(VNPTVideoCallSDK)) <CXCallObserverDelegate>
- (void)callObserver:(CXCallObserver * _Nonnull)callObserver callChanged:(CXCall * _Nonnull)call;
@end



@class CXProvider;
@class CXAnswerCallAction;
@class AVAudioSession;
@class CXEndCallAction;
@class CXStartCallAction;

SWIFT_AVAILABILITY(ios,introduced=10.0)
@interface CallProviderDelegate (SWIFT_EXTENSION(VNPTVideoCallSDK)) <CXProviderDelegate>
- (void)providerDidReset:(CXProvider * _Nonnull)provider;
- (void)provider:(CXProvider * _Nonnull)provider performAnswerCallAction:(CXAnswerCallAction * _Nonnull)action;
- (void)provider:(CXProvider * _Nonnull)provider didActivateAudioSession:(AVAudioSession * _Nonnull)audioSession;
- (void)provider:(CXProvider * _Nonnull)provider performEndCallAction:(CXEndCallAction * _Nonnull)action;
- (void)provider:(CXProvider * _Nonnull)provider performStartCallAction:(CXStartCallAction * _Nonnull)action;
@end


@class PKPushRegistry;
@class PKPushCredentials;
@class PKPushPayload;

@interface CallProviderDelegate (SWIFT_EXTENSION(VNPTVideoCallSDK)) <PKPushRegistryDelegate>
- (void)pushRegistry:(PKPushRegistry * _Nonnull)registry didUpdatePushCredentials:(PKPushCredentials * _Nonnull)pushCredentials forType:(PKPushType _Nonnull)type;
- (void)pushRegistry:(PKPushRegistry * _Nonnull)registry didReceiveIncomingPushWithPayload:(PKPushPayload * _Nonnull)payload forType:(PKPushType _Nonnull)type withCompletionHandler:(void (^ _Nonnull)(void))completion SWIFT_AVAILABILITY(ios,introduced=11.0);
@end


SWIFT_CLASS("_TtC16VNPTVideoCallSDK13CallingPerson")
@interface CallingPerson : NSObject <NSCopying>
- (id _Nonnull)copyWithZone:(struct _NSZone * _Nullable)zone SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end






SWIFT_CLASS("_TtC16VNPTVideoCallSDK11PersonIdApp")
@interface PersonIdApp : NSObject
- (nonnull instancetype)initWithId:(NSString * _Nonnull)id name:(NSString * _Nonnull)name;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class NSURLRequest;
@protocol StompClientLibDelegate;
@class SRWebSocket;

SWIFT_CLASS("_TtC16VNPTVideoCallSDK14StompClientLib")
@interface StompClientLib : NSObject <SRWebSocketDelegate>
@property (nonatomic) BOOL connection;
@property (nonatomic) BOOL certificateCheckEnabled;
- (void)sendJSONForDictWithDict:(id _Nonnull)dict toDestination:(NSString * _Nonnull)destination;
- (void)openSocketWithURLRequestWithRequest:(NSURLRequest * _Nonnull)request delegate:(id <StompClientLibDelegate> _Nonnull)delegate connectionHeaders:(NSDictionary<NSString *, NSString *> * _Nullable)connectionHeaders;
- (void)webSocket:(SRWebSocket * _Null_unspecified)webSocket didReceiveMessage:(id _Null_unspecified)message;
- (void)webSocketDidOpen:(SRWebSocket * _Null_unspecified)webSocket;
- (void)webSocket:(SRWebSocket * _Null_unspecified)webSocket didFailWithError:(NSError * _Null_unspecified)error;
- (void)webSocket:(SRWebSocket * _Null_unspecified)webSocket didCloseWithCode:(NSInteger)code reason:(NSString * _Null_unspecified)reason wasClean:(BOOL)wasClean;
- (void)webSocket:(SRWebSocket * _Null_unspecified)webSocket didReceivePong:(NSData * _Null_unspecified)pongPayload;
- (void)sendMessageWithMessage:(NSString * _Nonnull)message toDestination:(NSString * _Nonnull)destination withHeaders:(NSDictionary<NSString *, NSString *> * _Nullable)headers withReceipt:(NSString * _Nullable)receipt;
- (BOOL)isConnected SWIFT_WARN_UNUSED_RESULT;
- (void)subscribeWithDestination:(NSString * _Nonnull)destination;
- (void)subscribeWithHeaderWithDestination:(NSString * _Nonnull)destination withHeader:(NSDictionary<NSString *, NSString *> * _Nonnull)header;
- (void)unsubscribeWithDestination:(NSString * _Nonnull)destination;
- (void)beginWithTransactionId:(NSString * _Nonnull)transactionId;
- (void)commitWithTransactionId:(NSString * _Nonnull)transactionId;
- (void)abortWithTransactionId:(NSString * _Nonnull)transactionId;
- (void)ackWithMessageId:(NSString * _Nonnull)messageId;
- (void)ackWithMessageId:(NSString * _Nonnull)messageId withSubscription:(NSString * _Nonnull)subscription;
- (void)disconnect;
- (void)reconnectWithRequest:(NSURLRequest * _Nonnull)request delegate:(id <StompClientLibDelegate> _Nonnull)delegate connectionHeaders:(NSDictionary<NSString *, NSString *> * _Nonnull)connectionHeaders time:(double)time exponentialBackoff:(BOOL)exponentialBackoff;
- (void)stopReconnect;
- (void)autoDisconnectWithTime:(double)time;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_PROTOCOL("_TtP16VNPTVideoCallSDK22StompClientLibDelegate_")
@protocol StompClientLibDelegate
- (void)stompClientWithClient:(StompClientLib * _Null_unspecified)client didReceiveMessageWithJSONBody:(id _Nullable)jsonBody akaStringBody:(NSString * _Nullable)stringBody withHeader:(NSDictionary<NSString *, NSString *> * _Nullable)header withDestination:(NSString * _Nonnull)destination;
- (void)stompClientDidDisconnectWithClient:(StompClientLib * _Null_unspecified)client;
- (void)stompClientDidConnectWithClient:(StompClientLib * _Null_unspecified)client;
- (void)serverDidSendReceiptWithClient:(StompClientLib * _Null_unspecified)client withReceiptId:(NSString * _Nonnull)receiptId;
- (void)serverDidSendErrorWithClient:(StompClientLib * _Null_unspecified)client withErrorMessage:(NSString * _Nonnull)description detailedErrorMessage:(NSString * _Nullable)message;
- (void)serverDidSendPing;
@end


@protocol VNPTMeetDelegate;

SWIFT_CLASS("_TtC16VNPTVideoCallSDK8VNPTMeet")
@interface VNPTMeet : NSObject
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, strong) VNPTMeet * _Nonnull shared;)
+ (VNPTMeet * _Nonnull)shared SWIFT_WARN_UNUSED_RESULT;
@property (nonatomic, weak) id <VNPTMeetDelegate> _Nullable delegate;
@property (nonatomic, readonly, copy) NSString * _Nonnull yourDeviceId;
@property (nonatomic, readonly, copy) NSString * _Nonnull defaultDeviceName;
@property (nonatomic, strong) PersonIdApp * _Nullable personIdApp;
- (void)outgoingCallWithCaller:(PersonIdApp * _Nonnull)caller roomName:(NSString * _Nonnull)roomName :(NSArray<NSString *> * _Nonnull)recevicer additionalData:(NSDictionary<NSString *, id> * _Nullable)additionalData;
- (void)endCallWithCall:(CallingPerson * _Nonnull)call;
- (void)registerDevice;
- (void)removeDevice;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


@class UIApplication;
@class NSUserActivity;
@protocol UIUserActivityRestoring;

@interface VNPTMeet (SWIFT_EXTENSION(VNPTVideoCallSDK))
- (BOOL)application:(UIApplication * _Nonnull)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey, id> * _Nullable)launchOptions SWIFT_WARN_UNUSED_RESULT;
- (BOOL)application:(UIApplication * _Nonnull)application continue:(NSUserActivity * _Nonnull)userActivity restorationHandler:(void (^ _Nonnull)(NSArray<id <UIUserActivityRestoring>> * _Nullable))restorationHandler SWIFT_WARN_UNUSED_RESULT;
- (BOOL)application:(UIApplication * _Nonnull)app open:(NSURL * _Nonnull)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> * _Nonnull)options SWIFT_WARN_UNUSED_RESULT;
- (void)applicationWillTerminate:(UIApplication * _Nonnull)application;
@end


SWIFT_CLASS("_TtC16VNPTVideoCallSDK14VNPTMeetConfig")
@interface VNPTMeetConfig : NSObject
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, strong) VNPTMeetConfig * _Nonnull shared;)
+ (VNPTMeetConfig * _Nonnull)shared SWIFT_WARN_UNUSED_RESULT;
@property (nonatomic) BOOL ENABLE_OUTGOING_CALL_WAITTING_SCREEN;
@property (nonatomic) double IMCOMING_CALL_TIMEOUT;
@property (nonatomic) double TIMEOUT_CONNECTION;
@property (nonatomic) double TIMEOUT_INTERVAL;
@property (nonatomic, copy) NSString * _Nonnull VERSION;
@property (nonatomic, copy) NSString * _Nonnull TOKEN_ID;
@property (nonatomic, copy) NSString * _Nonnull TOKEN_KEY;
@property (nonatomic, copy) NSString * _Nonnull CLIENT_ID;
@property (nonatomic, copy) NSString * _Nonnull CLIENT_SECRET;
@property (nonatomic, readonly, copy) NSString * _Nonnull TOPIC_USING;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class VNPTMeetError;

SWIFT_PROTOCOL("_TtP16VNPTVideoCallSDK16VNPTMeetDelegate_")
@protocol VNPTMeetDelegate
- (void)vnptMeetWithDidRegisterPushVoipToken:(NSString * _Nonnull)token withError:(VNPTMeetError * _Nullable)error;
- (void)vnptMeetWithDidReceiveIncomingCall:(CallingPerson * _Nonnull)call;
- (void)vnptMeetWithDidReceiveCallPush:(CallingPerson * _Nonnull)call;
- (void)vnptMeetWithDidMakeACall:(CallingPerson * _Nonnull)call withError:(VNPTMeetError * _Nullable)error;
- (void)vnptMeetWithDidAcceptCall:(CallingPerson * _Nonnull)call withError:(VNPTMeetError * _Nullable)error;
- (void)vnptMeetWithDidEndCall:(CallingPerson * _Nonnull)call withError:(VNPTMeetError * _Nullable)error;
- (void)vnptMeetWithDidRejectCall:(CallingPerson * _Nonnull)call withError:(VNPTMeetError * _Nullable)error;
- (void)vnptMeetWithDidRemoveDevice:(BOOL)removed withError:(VNPTMeetError * _Nullable)error;
- (void)vnptMeetWithDidIncomingCallTimeout:(BOOL)timeout withError:(VNPTMeetError * _Nullable)error;
- (void)vnptMeetWithDidOutgoingCallTimeout:(BOOL)timeout withError:(VNPTMeetError * _Nullable)error;
@end


SWIFT_CLASS("_TtC16VNPTVideoCallSDK13VNPTMeetError")
@interface VNPTMeetError : NSObject
@property (nonatomic, copy) NSString * _Nonnull responseCode;
@property (nonatomic, copy) NSString * _Nonnull message;
@property (nonatomic) NSError * _Nullable error;
- (nonnull instancetype)initWithResponseCode:(NSString * _Nonnull)responseCode message:(NSString * _Nonnull)message error:(NSError * _Nullable)error;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


/// Decodes a JWT
SWIFT_CLASS_NAMED("_JWT")
@interface A0JWT : NSObject
/// token header part
@property (nonatomic, readonly, copy) NSDictionary<NSString *, id> * _Nonnull header;
/// token body part or claims
@property (nonatomic, readonly, copy) NSDictionary<NSString *, id> * _Nonnull body;
/// token signature part
@property (nonatomic, readonly, copy) NSString * _Nullable signature;
/// value of the <code>exp</code> claim
@property (nonatomic, readonly, copy) NSDate * _Nullable expiresAt;
/// value of the <code>expired</code> field
@property (nonatomic, readonly) BOOL expired;
/// Creates a new instance of <code>A0JWT</code> and decodes the given jwt token.
/// :param: jwtValue of the token to decode
/// :returns: a new instance of <code>A0JWT</code> that holds the decode token
+ (A0JWT * _Nullable)decodeWithJwt:(NSString * _Nonnull)jwtValue error:(NSError * _Nullable * _Nullable)error SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end

#if __has_attribute(external_source_symbol)
# pragma clang attribute pop
#endif
#pragma clang diagnostic pop
#endif
