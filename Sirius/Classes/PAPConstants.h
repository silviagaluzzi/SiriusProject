//
//  PAPConstants.h
//  Anypic
//
//  Created by Mattieu Gamache-Asselin on 5/25/12.
//  Copyright (c) 2013 Parse. All rights reserved.
//

typedef enum {
	PAPHomeTabBarItemIndex = 0,
	PAPEmptyTabBarItemIndex = 1,
	PAPActivityTabBarItemIndex = 2
} PAPTabBarControllerViewControllerIndex;


#define kPAPAutoFollowAccounts [NSArray arrayWithObjects:@"100008058069812", nil]

#pragma mark - NSUserDefaults
extern NSString *const kPAPUserDefaultsActivityFeedViewControllerLastRefreshKey;
extern NSString *const kPAPUserDefaultsCacheFacebookFriendsKey;

#pragma mark - Launch URLs

extern NSString *const kPAPLaunchURLHostTakePicture;


#pragma mark - NSNotification
extern NSString *const PAPAppDelegateApplicationDidReceiveRemoteNotification;
extern NSString *const PAPUtilityUserFollowingChangedNotification;
extern NSString *const PAPUtilityUserLikedUnlikedPhotoCallbackFinishedNotification;
extern NSString *const PAPUtilityDidFinishProcessingProfilePictureNotification;
extern NSString *const PAPTabBarControllerDidFinishEditingPhotoNotification;
extern NSString *const PAPTabBarControllerDidFinishImageFileUploadNotification;
extern NSString *const PAPPhotoDetailsViewControllerUserDeletedPhotoNotification;
extern NSString *const PAPPhotoDetailsViewControllerUserLikedUnlikedPhotoNotification;
extern NSString *const PAPPhotoDetailsViewControllerUserCommentedOnPhotoNotification;


#pragma mark - User Info Keys
extern NSString *const PAPPhotoDetailsViewControllerUserLikedUnlikedPhotoNotificationUserInfoLikedKey;
extern NSString *const kPAPEditPhotoViewControllerUserInfoCommentKey;


#pragma mark - Installation Class

// Field keys
extern NSString *const kPAPInstallationUserKey;


#pragma mark - PFObject Activity Class
// Class key
extern NSString *const kPAPActivityClassKey;

// Field keys
extern NSString *const kPAPActivityTypeKey;
extern NSString *const kPAPActivityFromUserKey;
extern NSString *const kPAPActivityToUserKey;
extern NSString *const kPAPActivityContentKey;
extern NSString *const kPAPActivityPhotoKey;

// Type values
extern NSString *const kPAPActivityTypeLike;
extern NSString *const kPAPActivityTypeFollow;
extern NSString *const kPAPActivityTypeComment;
extern NSString *const kPAPActivityTypeJoined;
extern NSString *const kPAPActivityTypeWish;
extern NSString *const kPAPActivityTypePurchase;

#pragma mark - PFObject Bolla Class
// Class Key
extern NSString *const kPAPBollaClassKey;

//Field keys
extern NSString *const kPAPBollaIDClienteKey;
extern NSString *const kPAPBollaQtaKey;
extern NSString *const kPAPBollaCodiceKey;
extern NSString *const kPAPBollaCodiceArticoloKey;
extern NSString *const kPAPBollaCodiceUnivocoKey;
extern NSString *const kPAPBollaDataKey;
extern NSString *const kPAPBollaIDOrdineKey;

#pragma mark - PFObject Brand Class
// Class Key
extern NSString *const kPAPBrandClassKey;

//Field keys
extern NSString *const kPAPBrandNameKey;

#pragma mark - PFObject CodiciUsati
// Class Key
extern NSString *const kPAPCodiciUsatiClassKey;

//Field keys
extern NSString *const kPAPCodiceUsatoCodUnivocoKey;
extern NSString *const kPAPCodiceUsatoUserKey;

/*
#pragma mark - PFObject Client Class
// Field keys
extern NSString *const kPAPClientClassKey;

extern NSString *const kPAPClientIdClienteKey;
extern NSString *const kPAPClientContentKey;
extern NSString *const kPAPClientDescrizioneKey;
extern NSString *const kPAPClientIdCaogioKey;
extern NSString *const kPAPClientWebUrlKey;
*/


#pragma mark - PFObject Clienti Class
// Field keys
extern NSString *const kPAPClientiClassKey;

extern NSString *const kPAPClientiIdClienteKey;
extern NSString *const kPAPClientiCittaKey;
extern NSString *const kPAPClientiDeletedKey;
extern NSString *const kPAPClientiEmailKey;
extern NSString *const kPAPClientiIdCaogioKey;
extern NSString *const kPAPClientiIsCaovillaKey;
extern NSString *const kPAPClientiLongDescKey;
extern NSString *const kPAPClientiNazioneKey;
extern NSString *const kPAPClientiPhoneHey;
extern NSString *const kPAPClientiShortDescKey;
extern NSString *const kPAPClientiViaKey;
extern NSString *const kPAPClientiWebUrlKey;

#pragma mark - PFObject User Class
// Field keys
extern NSString *const kPAPUserDisplayNameKey;
extern NSString *const kPAPUserFacebookIDKey;
extern NSString *const kPAPUserPhotoIDKey;
extern NSString *const kPAPUserProfilePicSmallKey;
extern NSString *const kPAPUserProfilePicMediumKey;
extern NSString *const kPAPUserFacebookFriendsKey;
extern NSString *const kPAPUserAlreadyAutoFollowedFacebookFriendsKey;

#pragma mark - PFObject Photo Class
// Class key
extern NSString *const kPAPPhotoClassKey;

// Field keys
extern NSString *const kPAPPhotoPictureKey;
extern NSString *const kPAPPhotoThumbnailKey;
extern NSString *const kPAPPhotoUserKey;
extern NSString *const kPAPPhotoCaptionKey;
extern NSString *const kPAPPhotoTypeKey;
extern NSString *const kPAPPhotoProductKey;

#pragma mark - Cached Photo Attributes
// keys
extern NSString *const kPAPPhotoAttributesIsLikedByCurrentUserKey;
extern NSString *const kPAPPhotoAttributesLikeCountKey;
extern NSString *const kPAPPhotoAttributesLikersKey;
extern NSString *const kPAPPhotoAttributesCommentCountKey;
extern NSString *const kPAPPhotoAttributesCommentersKey;
extern NSString *const kPAPPhotoAttributesCommentsKey;

#pragma mark - Cached User Attributes
// keys
extern NSString *const kPAPUserAttributesPhotoCountKey;
extern NSString *const kPAPUserAttributesIsFollowedByCurrentUserKey;


#pragma mark - PFPush Notification Payload Keys

extern NSString *const kAPNSAlertKey;
extern NSString *const kAPNSBadgeKey;
extern NSString *const kAPNSSoundKey;

extern NSString *const kPAPPushPayloadPayloadTypeKey;
extern NSString *const kPAPPushPayloadPayloadTypeActivityKey;

extern NSString *const kPAPPushPayloadActivityTypeKey;
extern NSString *const kPAPPushPayloadActivityLikeKey;
extern NSString *const kPAPPushPayloadActivityCommentKey;
extern NSString *const kPAPPushPayloadActivityFollowKey;

extern NSString *const kPAPPushPayloadFromUserObjectIdKey;
extern NSString *const kPAPPushPayloadToUserObjectIdKey;
extern NSString *const kPAPPushPayloadPhotoObjectIdKey;
