require 'spec_helper'

describe 'apache::mod::dav_svn', type: :class do
  it_behaves_like 'a mod class, without including apache'

  context 'default configuration with parameters' do
    context 'on a Debian OS' do
      let :facts do
        {
          lsbdistcodename: 'jessie',
          osfamily: 'Debian',
          operatingsystemrelease: '8',
          operatingsystemmajrelease: '8',
          concat_basedir: '/dne',
          operatingsystem: 'Debian',
          id: 'root',
          kernel: 'Linux',
          path: '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
          is_pe: false,
        }
      end

      it { is_expected.to contain_class('apache::params') }
      it { is_expected.to contain_apache__mod('dav_svn') }
      it { is_expected.to contain_package('libapache2-svn') }
    end
    context 'on a RedHat OS' do
      let :facts do
        {
          osfamily: 'RedHat',
          operatingsystemrelease: '6',
          operatingsystemmajrelease: '6',
          concat_basedir: '/dne',
          operatingsystem: 'RedHat',
          id: 'root',
          kernel: 'Linux',
          path: '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
          is_pe: false,
        }
      end

      it { is_expected.to contain_class('apache::params') }
      it { is_expected.to contain_apache__mod('dav_svn') }
      it { is_expected.to contain_package('mod_dav_svn') }
    end
    context 'on a FreeBSD OS' do
      let :facts do
        {
          osfamily: 'FreeBSD',
          operatingsystemrelease: '9',
          operatingsystemmajrelease: '9',
          concat_basedir: '/dne',
          operatingsystem: 'FreeBSD',
          id: 'root',
          kernel: 'Linux',
          path: '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
          is_pe: false,
        }
      end

      it { is_expected.to contain_class('apache::params') }
      it { is_expected.to contain_apache__mod('dav_svn') }
      it { is_expected.to contain_package('devel/subversion') }
    end
    context 'on a Gentoo OS', :compile do
      let :facts do
        {
          id: 'root',
          operatingsystemrelease: '3.16.1-gentoo',
          concat_basedir: '/dne',
          kernel: 'Linux',
          osfamily: 'Gentoo',
          operatingsystem: 'Gentoo',
          path: '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin',
          is_pe: false,
        }
      end

      it { is_expected.to contain_class('apache::params') }
      it { is_expected.to contain_apache__mod('dav_svn') }
      it { is_expected.to contain_package('dev-vcs/subversion') }
    end
  end
end
