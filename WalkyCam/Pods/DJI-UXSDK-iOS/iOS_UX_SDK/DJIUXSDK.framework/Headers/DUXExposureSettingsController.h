//
//  DUXExposureSettingsController.h
//  DJIUXSDK
//
//  Copyright © 2016 DJI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DJIUXSDK/UIImage+Assets.h>
#import <DJISDK/DJISDK.h>



/**
 *  Display:
 *  This panel shows all the camera settings that are related to exposure. It allows
 *  exposure mode selection (auto, aperture priority, shutter priority and manual)
 *  depending on the connected camera. Depending on the mode, the ISO, aperture,
 *  shutter speed and exposure compensation value can also be set.
 *  
 *  Interaction:
 *  All the settings are presented in ListView hierarchy.
 */
@interface DUXExposureSettingsController : UIViewController


/**
 *  Creates a new instance, configured and ready to use of
 *  DULExposureSettingsController.
 */
+ (instancetype)exposureSettingsController;


/**
 *  Selects which camera index widget refers to. Default value is 0.
 */
@property (assign, nonatomic) NSUInteger preferredCameraIndex;


/**
 *  Selects which lens index widget refers to. Default value is 0.
 */
@property (assign, nonatomic) NSUInteger preferredLensIndex;

@end
