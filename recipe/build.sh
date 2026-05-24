set -ex
python -m pip install --no-deps --ignore-installed ./tensorboard-${PKG_VERSION}-py3-none-any.whl
# Remove the strict protobuf requirement. Conda will manage it.
sed -i 's/^Requires-Dist: protobuf.*/Requires-Dist: protobuf/' ${SP_DIR}/tensorboard-${PKG_VERSION}.dist-info/METADATA
# Drop pip's install-provenance files so the dist-info reflects a clean conda
# install (conda rewrites INSTALLER to "conda"; these would otherwise still
# advertise a pip/local-wheel install).
rm -f ${SP_DIR}/tensorboard-${PKG_VERSION}.dist-info/direct_url.json \
      ${SP_DIR}/tensorboard-${PKG_VERSION}.dist-info/REQUESTED
