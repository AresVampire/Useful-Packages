# UI Display and Layout Widgets
- MaterialBanner: Displays an important message prominently at the top of the screen.
- PreferredSize: Defines preferred dimensions for custom app bar widgets.
- AspectRatio: Adjusts its child’s dimensions to maintain a specific aspect ratio.
- Flexible: Expands and shrinks widgets within a Flex container, like a Column or Row.
- Expanded: Occupies remaining space within a Flex container.
- Table: Creates a grid-based layout for organizing content in rows and columns.
- Stack: Allows widgets to overlap in layers, with a Z-ordering system.
- SafeArea: Ensures content avoids system UI intrusions, like notches or status bars.
- FittedBox: Scales its child widget to fit within its allocated space.

# Dialogs and Menus
- AlertDialog: Displays modal alerts with custom actions.
- PopupMenuButton: This shows a menu of options when pressed.
- CupertinoContextMenu: Displays a menu overlay in iOS style when a widget is long-pressed.
- ExpansionTile: Expands or collapses to reveal additional content when tapped.

# Forms and Input Controls
- CheckboxListTile: Combines a checkbox with a list item for options.
- DatePicker: Opens a calendar picker to select dates.
- TimePicker: Opens a clock interface for selecting time.
- DateRangePicker: Allows selection of a date range.
- Slider: A sliding control to select a value within a range.
- SelectableText: Enables text selection for copying.
- TextFormField: A text input field with form validation features.
- Switch: A toggle switch for binary choices.
- RadioListTile: Combines a radio button with a list item for selection.
- Stepper: Provides a step-by-step process UI, often used in forms.

# Animation and Effects
- AnimatedContainer: Creates a container that animates changes in its properties.
- AnimatedCrossFade: Crossfades between two widgets over time.
- AnimatedDefaultTextStyle: Animates changes in text styling.
- AnimatedIcon: Provides smooth animations between different icon states.
- AnimatedOpacity: Smoothly fades a widget in and out by adjusting opacity.
- AnimatedRotation: Animates rotation of a widget to create smooth transitions.
- Hero: Animates a widget across screens during navigation transitions.

# Drag-and-Drop and Gestures
- BottomSheet: Displays a modal sheet that slides up from the bottom.
- LongPressDraggable: Initiates a drag event when a widget is long-pressed.
- Draggable: Enables a widget to be dragged across the screen.
- DragTarget: Serves as a target destination for draggable items.
- Dismissible: Allows widgets to be dismissed, typically with a swipe gesture.
- GestureDetector: Detects various touch events like tap, drag, and long press.

# Lists and Grid Display
- ReorderableListView: Allows reordering of list items by drag-and-drop.
- GridView: Displays widgets in a scrollable grid.
- ListView: A scrollable list for displaying multiple items vertically or horizontally.
- GridTile: A tile with an optional header and footer that can be part of a GridView.
- GridTileBar: Provides a top or bottom bar with text or icons for grid tiles.

# Containers and Structure
- Card: A Material widget for creating elevated, shadowed containers.
- CupertinoSlidingSegmentedControl: A sliding segmented control in iOS style.
- Drawer: A panel that slides in from the side, often used for navigation.
- DrawerHeader: Displays a header within a drawer for profile or account info.
- FractionallySizedBox: Sizes its child widget relative to its parent container.
- FloatingActionButton: A circular button for primary screen actions.

# Navigation
- NavigationBar: Provides a navigation bar at the bottom of the screen.
- TabBar: Displays tabbed navigation for switching between different views.
- TabPageSelector: A visual indicator for current tab selection.

# Feedback and Indicators
- SnackBar: Displays a brief message at the bottom of the screen.
- RefreshIndicator: Provides pull-to-refresh functionality for scrollable content.
- Visibility: Shows or hides widgets without removing them from the layout.
- ErrorWidget: Shows an error message when a widget fails to load.

# Miscellaneous
- AutoComplete: Suggests completions as the user types in a field.
- CircleAvatar: Displays circular images or initials for profile icons.
- ChoiceChip: A chip that represents a single choice from a set.
- FutureBuilder: Manages asynchronous data and displays loading states.
- StreamBuilder: Manages stream data, updating the UI on each data event.
- OrientationBuilder: Adapts UI based on device orientation.
- OverflowBar: Wraps overflowing children onto multiple lines or a dropdown.
- Wrap: Arrange children in a wrap-around manner, adjusting for screen size.