Name:       qt5-qtgraphicaleffects
Summary:    Qt Graphical Effect
Version:    5.6.2
Release:    1%{?dist}
License:    BSD and ((LGPLv2 or LGPLv3) with exception or Qt Commercial)
URL:        https://github.com/sailfishos/qtgraphicaleffects
Source0:    %{name}-%{version}.tar.xz
Patch1:     qtgraphicaleffects-5.6.2-qmldir-declare-module.patch
BuildRequires:  qt5-qtcore-devel >= 5.6.2
BuildRequires:  qt5-qtgui-devel >= 5.6.2
BuildRequires:  qt5-qtopengl-devel >= 5.6.2
BuildRequires:  qt5-qtdeclarative-devel >= 5.6.2
BuildRequires:  qt5-qtdeclarative-qtquick-devel >= 5.6.2
BuildRequires:  qt5-qmake
BuildRequires:  fdupes

%description
Qt is a cross-platform application and UI framework. Using Qt, you can
write web-enabled applications once and deploy them across desktop,
mobile and embedded systems without rewriting the source code.
.
This package contains the Qt Graphical Effect library


#### Build section

%prep
%setup -q -n %{name}-%{version}/qtgraphicaleffects
%patch1 -p1

%build
export QTDIR=/usr/share/qt5
%qmake5 CONFIG+=package
make %{?_smp_flags}

%install
rm -rf %{buildroot}
%qmake_install
# Fix wrong path in pkgconfig files
#find %{buildroot}%{_libdir}/pkgconfig -type f -name '*.pc' \
#-exec perl -pi -e "s, -L%{_builddir}/?\S+,,g" {} \;
# Fix wrong path in prl files
#find %{buildroot}%{_libdir} -type f -name '*.prl' \
#-exec sed -i -e "/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/" {} \;
# Remove unneeded .la files
#rm -f %{buildroot}/%{_libdir}/*.la
#%fdupes %{buildroot}/%{_includedir}


#### Pre/Post section

%post
/sbin/ldconfig
%postun
/sbin/ldconfig

#### File section

%files
%defattr(-,root,root,-)
%license LICENSE.LGPLv21
%license LICENSE.LGPLv3
%license LGPL_EXCEPTION.txt
%{_libdir}/qt5/qml/QtGraphicalEffects/*

