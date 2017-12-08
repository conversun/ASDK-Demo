/**
 * Copyright (c) 2016 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#import "Factories.h"

@implementation NSAttributedString (Factories)

+ (NSAttributedString *)attributedStringForTitleText:(NSString *)text {
  NSDictionary *titleAttributes = @{NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-Heavy" size:30],
                                    NSForegroundColorAttributeName: [UIColor whiteColor],
                                    NSShadowAttributeName: [NSShadow titleTextShadow],
                                    NSParagraphStyleAttributeName: [NSParagraphStyle justifiedParagraphStyle]};

  return [[NSAttributedString alloc] initWithString:text attributes:titleAttributes];
}

+ (NSAttributedString *)attributedStringForDescription:(NSString *)text {
  NSDictionary *descriptionAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize:18],
                                          NSForegroundColorAttributeName: [UIColor whiteColor],
                                          NSBackgroundColorAttributeName: [UIColor clearColor],
//                                          NSShadowAttributeName: [NSShadow descriptionTextShadow],
//                                          NSParagraphStyleAttributeName: [NSParagraphStyle justifiedParagraphStyle]
                                          
                                          };

  return [[NSAttributedString alloc] initWithString:text attributes:descriptionAttributes];
}

@end


@implementation NSParagraphStyle (Factories)

+ (NSParagraphStyle *)justifiedParagraphStyle {
  NSMutableParagraphStyle *paragraphStlye = [[NSMutableParagraphStyle alloc] init];
  paragraphStlye.alignment = NSTextAlignmentJustified;
  return paragraphStlye;
}

@end


@implementation NSShadow (Factories)

+ (NSShadow *)titleTextShadow {
  NSShadow *shadow = [[NSShadow alloc] init];
  shadow.shadowColor = [UIColor colorWithHue:0 saturation:0 brightness:0 alpha:0.3];
  shadow.shadowOffset = CGSizeMake(0, 2);
  shadow.shadowBlurRadius = 3.0;

  return shadow;
}

+ (NSShadow *)descriptionTextShadow {
  NSShadow *shadow = [[NSShadow alloc] init];
  shadow.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.3];
  shadow.shadowOffset = CGSizeMake(0, 1);
  shadow.shadowBlurRadius = 3.0;

  return shadow;
}
@end
