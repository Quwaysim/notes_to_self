View
=====
func addSubview(_ view: UIView) // done on the parent view <br>
func removeFromSuperview() // done on the view itself <br>
int(from: CGRect) // initialized via code add <br>
int(from: NSCoder) // initialized via storyboard <br>
awakeFromNib() // called on all views if they came out of a storyboard & after they were initialized. order is not guaranteed. <br>
 
CGFloat
=======
CGFloat, CG = Core Graphics <br>
CGPoint <br>
CGSize <br>
CGRect = Rectangle, Starting Point, height, & width <br>

UIView
=======
- bounds: CGRect // an internal view's coordinate system <br>
- center: CGPoint // center point of the view's parent <br>
- frame: CGRect // the rect containing a UIView in its superview's coordinate system <br>
```
let labelRect = CGRect(x: 20, y: 20, width: 100, height: 40)
let label = UILabel(frame: labelRect)
label.text = "Hello"
view.addSubview(label)

setNeedsDisplay() // invalidate() equivalent
setNeedsDisplay(_ rect: CGRect) // can specify the rect that needs updating as opposed to the entire view

override draw(CGRect)
- UIGraphicsGetCurrentContext() , you need a context to draw, creates paths out of lines

let path = UIBezierPath()
path.move(to: CGPoint(80, 50))
path.addLine(to: CGPoint(140, 150))
path.addLine(to: CGPoint(10, 150))
path.close()
UIColor.green.setFill()
UIColor.red.setStroke()
path.linewidth = 3.0
path.fill()
path.stroke()

var opaque = false // to make transparent
var isHidden = true // to hide
```

Fonts
=====
UIFontTextStyle.headline <br>
UIFontTextStyle.body <br>
UIFontTextStyle.footnote <br>

Respects people's preferred font's system sizes, as a opposed to hardcoded font sizes <br>
```
let font = UIFont(name: "Helvetica", size: 36.0)

let metrics = UIFontMetrics(forTextStyle: .body)
let fontToUse = metrics.scaledFont(for: font) // apply custom font to system respecting size  
```
UIImageView
===========
```
let image: UIImage? = UIImage(named: "foo")
add "foo.jpg" to Assets.xcassets
let image: UIImage? = UIImage(contextOfFile: path)
let image: UIImage? = UIImage(data: aData)
```
when the device rotates, the image does not redraw automatically, you need set the UIView's contextmode to specify how to handle that <br>
```
var contentMode: UIViewContextMode
.left/.right, etc // doesn't scale just moves the image
.scaleToFill // default, scales per bounds set
.reDraw // 
```

MVC
===
UITabBarController: Bottom nav tabs <br>
UISplitViewController: Master / Detail <br>
UINavigationController: Card Stack of MVC, like Settings Page, includes Toolbar and backbutton <br>

To get view controller children: var viewControllers: [UIViewController]? { get set } <br>
To get whom you belong to: <br>
   tabBar: var tabBarController: UITabBarController? { get } <br>
   splitView: var splitViewController: UISplitViewController? { get } <br>
   navigation: var navigationController: UINavigationController? { get } <br>
   detail: if let detail: UIViewcontroller? = splitViewController?.viewControllers[1] <br>

push controller: pushViewController(_vc <br>
pop controller: pop <br>
    - we use segues instead <br>

Segues
============
They create new instances of MVC's <br>
Modal Segues <br>
      - good for modals, can be full screen <br>
PopOvers <br>
	 - are smaller modals that point to what started it. dictionary popup is a good example <br><br>
Unwind Segue <br>
       - does not create a new MVC <br>
       - good for jumping back a few stacks <br><br>
Embed Segue <br>
      - Allows for moving a view into another VC <br><br>
Show Segue <br><br>
Show detail segue <br><br>

func performSegue(withIdentifier: String, sender: Any?) <br>
     - sender can be whomever, however when specifying it via ui it's always declared <br>
```
func prepare(for: segue: UIStoryboardSegue, sender: Any?) {
     if let identifier = segue.identifier {
     	switch identifier {
	       		  case "Show Graph":
					if let vc = segue.destination as? GraphController {
					       	    vc.property1 = ""
										vc.callMethodToSetItUp()
													}
															default: break
																 }
																 }
}
```
View Controller
===============
- instantiated <br>
- awakeFromNib  <br>
  - all story board items are hit <br>
  - avoid if possible <br>
- preparing segue <br>
- outlet setting <br>
- view appearing & disappearing <br>
  - view did load <br>
    - called once <br>
      - does not set bounds, just loads views <br>

      - view will appear <br>
      	- can't do geometry <br>
	  - can be called multiple times <br>
	    - load from model <br>

	    - view will Layout SubViews() <br>
	      - can be called many times <br>
	      	- can do geometry work <br>

		- view did Layout SubViews() <br>

		- view did appear <br>
		  - show animation, capture gps location <br>
		    - kick off an expensive task <br> <br>

		    - view will disappear <br>
		      - if you started a timer, gps, etc in didAppear, turn it off <br> <br>

		      - view did disappear <br>
		      	- clean mvc, saving state? rarely used <br>
- low memory <br>

Scroll View
===========
- scrollView.contentSize = CGSize(width: 3000, height: 2000) <br>
- scrollView.contentOffset.y, scrollView.contentOffset.x <br>
- let visibleRect: CGRect = subview.convert(scrollView.bounds, from: scrollview) <br>

Multithreading
==============
Queue = Thread Pools <br>
      - let mainQueue = DispatchQueue.main // ui thread <br>
      - let backgroundQueue = DispatchQueue.global(qos: DispatchQos) <br>
      - DispatchQueue.userInteractive // high priority, short & quick <br>
      - DispatchQueue.userInitiated // high pri, might take some time <br>
      - DispatchQueue.background // not initiated by user, can run slowly <br>
      - DispatchQueue.utility // long running background processes, low priority <br>
      - DispatchQueue() <br> <br>

queue.async { ... } // stays on current thread <br>
queue.sync { ... } // blocks current thread <br>

Network Call
============
```
if let url = URL(string: "http://stanford.edu/") {
   let task = sessions.dataTask(with: url) { (data: Data?, response, error) in
       // do something with data
       	  DispatchQueue.main.async {
					// do ui stuff
					   }
						print("did some stuff with the data, but UI part has/not happened")

						}
						task.resume()
}
print("done firing off the request for the url's contents")
```
Sizes
======
all views are either "compact" or "regular" in width or height <br>
iPhone  <br>
	- portrait: compact in width & regular in height <br>
	- landscape: compact in both width & height <br>
let myHorizontalSizeClass: UIUserInterfaceSizeClass = traitCollection.horizontalSizeClass
    -> enum either .compact, .regular, .unspecified <br>

ActionSheet
======
```
var alert = UIAlertController (
    title: "Foo",
    message: "Some description",
    preferredStyle: .actionSheet // .alert
)
alert.addAction(UIAlertAction(
	title: "Closeup of Sun",
	style: .destructive)
	{
		(action: UIAlertAction) -> Void in
			 		// commands
					}
)
alert.addAction(UIAlertAction(
	title: "Cancel",
	style: .cancel)
	{
		(action: UIAlertAction) -> Void in
			 		// do nothing
					}
)
alert.modalPresentationStyle = .popover // makes a popup instead of bottom sheet on ipad per "adapting"
present(alert, animated: true, completion: nil)
```

Application Lifecycle
=====================
- Not Running <br>
- Foreground <br>
  - Inactive <br>
  - Active <br>
- Background <br>
  - transitory <br>
- Suspended <br>
  - no code is running <br>
  - can be killed <br>

App Delegate
=============
- func application(UIApplication, will/didFinishLaunchingWithOptions: [UIApplicationLaunchOptionsKey: Any]? = nil)
  UIApplicationDidFinishLaunching <br>
  				  - prestory boards, that's where UI was made <br>

- func applicationWillResignActive(UIApplication) <br>
  - UIApplicationWillResignActive // when your app gets paused from a phone call, or on your way to the background <br>

- func applicationDidBecomeActive(UIApplication) <br>
  - UIApplicationDidBecomeActive // if you were previously paused and now you're reactivating <br>

- func applicationDidEnterBackground(UIApplication) <br>
  - UIApplicationDidEnterBackground // you get 30 seconds or so, be prepared to die. you can ask for an extension, but will be denied if abused <br>

- func applicationWillEnterForeground(UIApplication) <br>
  - UIApplicationWillEnterForeground // when you were not killed from background, will become active soon <br>

====

- can do background fetches <br>

UIApplication
==============
- single instance <br>
- manages all glbal behavior <br>
- registerPush <br>
- here can ask for more background time <br>
- func setMinimumBackgroundFetchInterval(TimeInterval), UIApplicationBackgroundFetchIntervalMinimum <br>
  - func beingBackgroundTask(withExpirationHandler: (() -> Void)?) -> UIBackgroundTaskIdentifier
    	  endBackgroundTask(UIBackgroundTaskIdentifier) // need to call when you're done <br>
- turning on the "network in use" <br>
     - var isNetworkActivityIndicatorVisible: Bool <br>

- var backgroundTimeRemaining: TimeInterval { get } // time until you're suspended <br>
- var applicationState: UIApplicationState { get } // foreground, background, active <br>

Info.plist
==========
Many application settings are here

Storyboard vs Code
==========
I’m fan of coding. And not because it’s so great but because Storyboards are so bad. I’m writing in thread to not begin fight on main thread.
My reasons are following:
- Storyboards cause merge conflicts
- Storyboards are set of hardcoded values, it means you cannot easily change all fonts or colors for some labels just by changing one value across all app, some will tell you that you can fix it later in code so watch next point
- Duplicated “code”, because not all can be set in Storyboards like rounded corners for labels, so you need to post configure this label in viewDidLoad. It creates two places where you need to configure label.
- Forgotten bindings. It’s really easy to forget about then and you have to go back, load this slow Stroryboard and bind @IBOutlet or @IBAction
- Bugs in Storyboards (I had many of them, wasting of time to write about them here)
- More complex views are nightmare in Storybaords
- Weak reusability of views and view controller (but you have there aliases, so it’s not so bad)
- I could write about it even more.
- Difficult debugging of constraints.