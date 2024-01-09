import 'package:flutter/material.dart';

class BottomNavigationBarVacaba extends StatefulWidget {
  final List<BottomNavigationBarVacabaItem> items;
  final Color activeColor;
  final Color color;

  const BottomNavigationBarVacaba(
      {required this.items,
      required this.activeColor,
      required this.color,
      Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomNavigationBarVacabaState();
}

class _BottomNavigationBarVacabaState extends State<BottomNavigationBarVacaba> {
  final GlobalKey _keyBottomBar = GlobalKey();
  int _indexPageSelected = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Stack(
        key: _keyBottomBar,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: _createNavigationIconButtonList(widget.items.asMap())),
        ],
      );

  List<_NavigationIconButton> _createNavigationIconButtonList(
      Map<int, BottomNavigationBarVacabaItem> mapItem) {
    List<_NavigationIconButton> children = List<_NavigationIconButton>.from([]);
    mapItem.forEach((index, item) => children.add(_NavigationIconButton(
            (index == _indexPageSelected) ? item.activeIcon : item.icon,
            (index == _indexPageSelected) ? widget.activeColor : widget.color,
            item.txt,
            item.show,
            item.onTap, () {
          _changeOptionBottomBar(index);
        })));
    return children;
  }

  void _changeOptionBottomBar(int indexPageSelected) {
    if (indexPageSelected != _indexPageSelected) {
      _indexPageSelected = indexPageSelected;
    }
  }
}

class BottomNavigationBarVacabaItem {
  final String icon;
  final String activeIcon;
  final String txt;
  final NavigationIconButtonTapCallback onTap;
  final Color colorIcon;
  final bool show;
  const BottomNavigationBarVacabaItem(
      {required this.icon,
      required this.activeIcon,
      required this.onTap,
      required this.txt,
      this.show = true,
      required this.colorIcon});
}

typedef NavigationIconButtonTapCallback = void Function();

class _NavigationIconButton extends StatefulWidget {
  final String _icon;
  final bool _show;
  final Color _colorIcon;
  final String _txt;
  final NavigationIconButtonTapCallback _onTapInternalButton;
  final NavigationIconButtonTapCallback _onTapExternalButton;

  const _NavigationIconButton(this._icon, this._colorIcon, this._txt,
      this._show, this._onTapInternalButton, this._onTapExternalButton,
      {Key? key})
      : super(key: key);

  @override
  _NavigationIconButtonState createState() => _NavigationIconButtonState();
}

class _NavigationIconButtonState extends State<_NavigationIconButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  double _opacityIcon = 1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _scaleAnimation = Tween<double>(begin: 1, end: 0.93).animate(_controller);
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTapDown: (_) {
          _controller.forward();
          setState(() {
            _opacityIcon = 0.7;
          });
        },
        onTapUp: (_) {
          _controller.reverse();
          setState(() {
            _opacityIcon = 1;
          });
        },
        onTapCancel: () {
          _controller.reverse();
          setState(() {
            _opacityIcon = 1;
          });
        },
        onTap: () {
          widget._onTapInternalButton();
          widget._onTapExternalButton();
        },
        child: Container(
          color: Colors.transparent,
          width: 61,
          height: 56,
          padding: const EdgeInsets.only(top: 10.4),
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: AnimatedOpacity(
                opacity: _opacityIcon,
                duration: const Duration(milliseconds: 200),
                child: Column(
                  children: [
                    widget._show
                        ? ImageIcon(AssetImage(widget._icon),
                            size: 24.0, color: widget._colorIcon)
                        : const Icon(
                            Icons.ac_unit,
                            color: Colors.transparent,
                            size: 24.0,
                          ),
                    const SizedBox(height: 4.0),
                    Text(
                      widget._txt,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 10.0,
                        fontWeight: FontWeight.w700,
                        color: widget._colorIcon,
                      ),
                    ),
                  ],
                )),
          ),
        ),
      );
}
